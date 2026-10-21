# my-tools

내가 쓰려고 만든 작은 웹 도구 모음. 순수 HTML/CSS/JS라서 GitHub Pages에 그대로 올라갑니다.

```
my-tools/
├── index.html        ← 허브(카드 목록)
├── .nojekyll
└── toeic/
    ├── index.html    ← 토익 스터디 도구
    └── words.js      ← 기본 단어 목록 (여기에 단어 추가 가능)
```

## 처음 배포하기 (Git Bash)

1. GitHub에서 새 저장소 `my-tools` 생성 (Public, README 체크 해제)
2. 이 폴더에서:

```bash
git init
git add .
git commit -m "init: toolbox hub + toeic study"
git branch -M main
git remote add origin https://github.com/<내아이디>/my-tools.git
git push -u origin main
```

3. 저장소 → **Settings → Pages** → Source: `Deploy from a branch`, Branch: `main` / `/ (root)` → Save
4. 1~2분 뒤 `https://<내아이디>.github.io/my-tools/` 접속

## 새 도구 추가하기

1. 폴더 하나 만들기 (예: `pomodoro/index.html`)
2. 루트 `index.html`의 주석 처리된 카드 템플릿을 복사해서 `href="pomodoro/"`로 수정
3. `git add . && git commit -m "add pomodoro" && git push` → 자동 재배포

## 데이터 저장

기록은 브라우저 localStorage에 저장돼요. 폰/PC가 따로 저장되니 토익 페이지 **설정 → JSON 내보내기/불러오기**로 옮기세요.
