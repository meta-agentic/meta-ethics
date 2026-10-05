% Linkage attack on a keyed working state (theorem "Keyed views re-identify").
% Claim under test: "the working state is visible to every party under keyed
% identifiers; attribution is what the browsing parameter scopes".
% The attacker is an ordinary party that sees (i) the keyed working state,
% (ii) acts of power, attributed for good under A2 (votes, delegations),
% (iii) interim eligibility exclusions, which are visible effects,
% (iv) its own findings.  It never resolves a key through the key store.
%
% Roster of five humans; findings keyed per party (one key per party, the
% shape the fold needs to cap open findings per party).

person(ann). person(bob). person(cat). person(dan). person(eve).
attacker(eve).

% key store (NOT visible to the attacker; used only by the fold)
key_of(ann, k1). key_of(bob, k2). key_of(cat, k3). key_of(dan, k4). key_of(eve, k5).

% --- keyed working state, visible to every party --------------------------
% wfinding(Finding, SubjectKey, Rule, Object, TimeBucket)
wfinding(f1, k2, r_scope,  obj_ledger, 3).
wfinding(f2, k2, r_inform, obj_none,   5).
wfinding(f3, k3, r_inform, obj_none,   5).
wfinding(f4, k1, r_inform, obj_none,   5).
wfinding(f5, k5, r_inform, obj_none,   6).   % about the attacker itself

% --- attributed acts of power (A2: kept and attributed for good) -----------
% delegation scopes are acts of power, so who may touch which object is public
scope(bob, obj_ledger). scope(eve, obj_other). scope(ann, obj_other).
% matter m7 cites f3; interim exclusion on the cited matter is visible
cites(m7, f3).
roster(m7, ann). roster(m7, bob). roster(m7, cat). roster(m7, dan). roster(m7, eve).
voted(m7, ann). voted(m7, bob). voted(m7, dan). voted(m7, eve).
vote_refused(m7, cat).                       % intake rejection, logged (D15)

% --- attack 1: object scope is public; a finding on an object only one party
%     may touch names that party.
cand1(F, P) :- wfinding(F, _, _, O, _), O != obj_none, scope(P, O).
ncand1(F, N) :- wfinding(F, _, _, O, _), O != obj_none, N = #count{ P : cand1(F, P) }.
resolved(K, P) :- wfinding(F, K, _, _, _), ncand1(F, 1), cand1(F, P).

% --- attack 2: an interim exclusion on a matter citing one finding names the
%     finding's subject (the refusal is an attributed, logged effect).
ncites(M, N) :- cites(M, _), N = #count{ F : cites(M, F) }.
resolved(K, P) :- cites(M, F), ncites(M, 1), wfinding(F, K, _, _, _), vote_refused(M, P).

% --- attack 3: one key per party links every finding under that key; a key
%     resolved once resolves all of its findings.
linked(F, P) :- wfinding(F, K, _, _, _), resolved(K, P).

% --- attack 4: elimination.  The attacker knows its own key; once all but one
%     key and all but one person are resolved, the rest follows.
resolved(K, P) :- attacker(P), wfinding(_, K, _, _, _), own_key(K).
own_key(k5).                                  % the attacker sees its own findings
some_key(K) :- wfinding(_, K, _, _, _).
key_done(K) :- resolved(K, _).
person_done(P) :- resolved(_, P).
open_key(K) :- some_key(K), not key_done(K).
n_open_keys(N) :- N = #count{ K : open_key(K) }.
% people who appear as subjects: here every roster member not yet resolved
open_person(P) :- person(P), not person_done(P), subject_somewhere(P).
subject_somewhere(P) :- person(P), P != dan.   % side information: dan has no findings
                                                % (e.g. he said so, or a count is 0)
n_open_persons(N) :- N = #count{ P : open_person(P) }.
elim(K, P) :- open_key(K), open_person(P), n_open_keys(1), n_open_persons(1).

% attack success (is the scoping illusory?)
exposed(P) :- resolved(_, P), not attacker(P).
exposed(P) :- elim(_, P).

% ============================ mitigated view ==============================
% Fix sketch: parties see a closure-sufficient view only.  Each finding is shown
% under a per-finding handle (no per-party key), with rule and closure
% requirement; object and fine time are shown only when at least k parties
% could be its subject.  Whether *you* may close it is shown to you alone.
anon_k(3).
show_detail(F) :- wfinding(F, _, _, O, _), O != obj_none, ncand1(F, N), anon_k(Kk), N >= Kk.
view(F, R) :- wfinding(F, _, R, _, _).                   % handle + rule, always
view_object(F, O) :- wfinding(F, _, _, O, _), show_detail(F).
% attack 1 now has nothing to join on for f1; attack 3 has no shared key.
% Attack 2 is NOT closed by any view: the exclusion is an effect on an
% attributed act.  It is inherent while the finding is in use.
m_resolved_by_effect(F, P) :- cites(M, F), ncites(M, 1), vote_refused(M, P).

% EXPECT: resolved(k2,bob)
% EXPECT: resolved(k3,cat)
% EXPECT: linked(f2,bob)
% EXPECT: elim(k1,ann)
% EXPECT: exposed(bob)
% EXPECT: exposed(cat)
% EXPECT: exposed(ann)
% EXPECT-NOT: view_object(f1,obj_ledger)
% EXPECT: view(f1,r_scope)
% EXPECT: m_resolved_by_effect(f3,cat)
