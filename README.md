# PTP (事後確率計算機)

iPhone / iPod touch アプリケーション:事後確率計算機は、ベイズの定理に基づき、疾患の事前確率と検査の感度・特異度を入力することによって、事後確率を求めることができます。ベイズの定理の考え方は、最近の医師国家試験でも出題されています。
- positive result: 検査結果が陽性であった場合の事後確率
- negative result: 検査結果が陰性であった場合の事後確率
- positive likelihood ratio: 陽性尤度比
- negative likelihood ratio: 陰性尤度比

例題

Q1) 3人兄弟の上2人が39度の発熱、関節痛と全身倦怠感で病院を受診し、インフルエンザと診断された。翌日に3番目の弟が全く同じ症状で病院を訪れた。
80%の確率でインフルエンザと思われたが、迅速検査の結果は陰性だった。この迅速検査の結果はどの程度信用できるか?
事前確率80% 検査の感度70% 特異度95% とする。

A1) 計算結果では、迅速検査陰性でも事後確率は55.8%となる。従って、たとえ検査陰性であってもインフルエンザである可能性の方が高い。

Q2) 先天性甲状腺機能低下症(クレチン症)の発症頻度は3000人の出生に1人(0.033%)といわれている。新生児マススクリーニング法(ガスリー法)でクレチン症の疑いとされたものに真のクレチン症が含まれる割合はどれくらいか?
事前確率0.033% 検査の感度100% 特異度99% とする。

A2) 計算結果では、ガスリー法で陽性でも事後確率は3.2%と低い。

教訓「検査結果の解釈は、事前確率が高いか低いかによって大きく変わってくる。検査結果は絶対ではない。臨床情報から事前確率を推測することが重要である。」

