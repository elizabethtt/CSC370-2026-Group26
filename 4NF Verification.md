## 4 NF Verification

T he purpose of this analysis is to evaluate our updated relational schema and determine w hether the identified functional dependencies (FDs) and multivalued dependencies (MVDs) s atisfy Fourth Normal Form (4NF).

W e know a relation satisfies 4NF if every non-trivial MVD 𝑋 ↠ 𝑌 has a superkey 𝑋.

T o perform our verification, we use the following properties:

- E very FD 𝑋 → 𝑌 a lso implies MVD 𝑋 ↠ 𝑌

- An MVD is trivial if 𝑌 ⊆ 𝑋 o r 𝑋 ∪ 𝑌 c ontains all attributes in the relation

- An MVD can also describe independent sets of values, even when there is no c orresponding FD

W e evaluate the FDs and MVDs, disregard trivial MVDs, calculate attribute closures to test s uperkeys, and decompose only if a non-trivial MVD has a determinant that is not a superkey.

## F D and MVD Analysis

## 1 . Users

R elation: USERS(user_id, name, email, password, date_joined)

- Primary key: {user_id}

- Key-derived functional dependency: user_id → name, email, password, d ate_joined

- Implied MVDs: user_id ↠ name, user_id ↠ email, user_id ↠ password, user_id ↠ d ate_joined

- Attribute closure: {user_id}⁺ = {user_id, name, email, password, date_joined}

- Superkey: user_id (yes)

T he MVDs implied by the identified FD satisfy the 4NF condition because user_id is a s uperkey and its closure contains every attribute in USERS. No additional 4NF-violating d ependencies have been identified in the current analysis.

## 4 NF Evaluation:

## 2 . STUDY_SPOTS

R elation: STUDY_SPOTS(spot_id, name, location, type)

- Primary key: {spot_id}

- Key-derived functional dependency: spot_id → name, location, type

- Implied MVDs: spot_id ↠ name, spot_id ↠ location, spot_id ↠ type


- Attribute closure: {spot_id}⁺ = {spot_id, name, location, type}

- Superkey: spot_id (yes)

4 NF Evaluation:

T he MVDs implied by the identified FD satisfy the 4NF condition because spot_id is a s uperkey and its closure contains every attribute in STUDY_SPOTS. No additional

4 NF-violating dependencies have been identified in the current analysis.

## 3 . REVIEWS

R elation: REVIEWS(review_id, user_id, spot_id, review_date, rating, outlet_availability, n oise_level, description)

- Primary key: {review_id}

- Foreign keys:

- user_id references USERS(user_id)

- spot_id references STUDY_SPOTS(spot_id)

- Key-derived functional dependency: review_id → user_id, spot_id, review_date, r ating, outlet_availability, noise_level, description

- Implied MVDs: review_id ↠ user_id, review_id ↠ spot_id, review_id ↠ r eview_date, review_id ↠ rating, review_id ↠ outlet_availability, review_id ↠ n oise_level, review_id ↠ description

- Attribute closure: {review_id}⁺ = {review_id, user_id, spot_id, review_date, rating, o utlet_availability, noise_level, description}

- Superkey: review_id (yes)

4 NF Evaluation: T he MVDs implied by the identified FD satisfy the 4NF condition because review_id is a

s uperkey and its closure contains every attribute in REVIEWS. No additional 4 NF-violating dependencies have been identified in the current analysis.

## I ndependent MVD Analysis

W e also considered whether any of our relations contain independent multivalued attributes b eyond those implied by the identified functional dependencies.

F or example, in REVIEWS, a user can submit multiple reviews with different ratings. However, e ach rating is associated with a specific review and study spot. This does not establish user_id ↠ rating, because ratings cannot necessarily be combined independently with every study spot r eviewed by that user.

S imilarly, the current STUDY_SPOTS design stores one type per study spot, and our

d ocumented requirements do not identify separate independent collections of values within that r elation.


T herefore, no additional non-trivial independent MVDs have been established from our current r equirements. This analysis may need to be revisited if future requirements introduce i ndependently multivalued attributes.

## S ummary

| R elation | P rimary Key | I dentified MVD | L HS Superkey? | 4 NF Violation |
| --- | --- | --- | --- | --- |
|   |   | D eterminant |   | I dentified? |
| U SERS | u ser_id | u ser_id | Y es | N o |
| S TUDY_SPOTS spot_id |   | s pot_id | Y es | N o |
| R EVIEWS | r eview_id | r eview_id | Y es | N o |

## C onclusion

B ased on the identified key-derived functional dependencies and the multivalued dependencies t hey imply, no 4NF violations have been identified in our updated relational schema. Each i dentified dependency has a superkey on its left-hand side, as demonstrated by the attribute c losures above. Our current requirements do not establish any additional independent n on-trivial MVDs that would require decomposition. Therefore, no further decomposition is n ecessary based on the dependencies analyzed.
