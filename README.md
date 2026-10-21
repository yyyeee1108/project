# project

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

1. GitHub에서 새 저장소 `project` 생성 (Public, README 체크 해제)
2. 이 폴더에서:

```bash
git init
git add .
git commit -m "init: toolbox hub + toeic study"
git branch -M main
git remote add origin https://github.com/<내아이디>/project.git
git push -u origin main
```

3. 저장소 → **Settings → Pages** → Source: `Deploy from a branch`, Branch: `main` / `/ (root)` → Save
4. 1~2분 뒤 `https://<내아이디>.github.io/project/` 접속

## 새 도구 추가하기

1. 폴더 하나 만들기 (예: `pomodoro/index.html`)
2. 루트 `index.html`의 주석 처리된 카드 템플릿을 복사해서 `href="pomodoro/"`로 수정
3. `git add . && git commit -m "add pomodoro" && git push` → 자동 재배포

## 클라우드 동기화 설정 (Supabase, 무료) — 폰·PC 같은 데이터

1. https://supabase.com 가입 → **New project** (이름 아무거나, 리전 `Northeast Asia (Seoul)`, `Enable Data API` 켜기, `Automatically expose new tables` 끄기, DB 비밀번호는 Generate 후 저장해 두기)
2. 왼쪽 **SQL Editor** → `supabase.sql` 내용을 통째로 붙여넣고 **Run** (내 데이터만 볼 수 있게 하는 보안 규칙 포함)
3. **Project Settings → API**에서 `Project URL`과 `anon public` 키를 복사해서 `config.js`에 붙여넣기
   (anon 키는 공개돼도 되는 키예요. **service_role 키는 절대 넣지 마세요**)
4. **Authentication → Sign In / Providers → Email**: 처음엔 `Confirm email`을 꺼두면 가입 즉시 로그인돼서 편해요
5. **Authentication → URL Configuration**: Site URL을 `https://<내아이디>.github.io/project/toeic/`로 설정
6. `git add . && git commit -m "enable cloud sync" && git push`
7. 토익 페이지 **설정 → 클라우드 동기화**에서 가입/로그인 (폰에서도 같은 계정으로)

동작: 변경하면 1~2초 뒤 자동 저장, 폰/PC에서 탭으로 돌아올 때 자동으로 최신 데이터를 불러와요.
충돌 시에는 마지막으로 수정한 쪽이 이겨요 (한 번에 한 기기에서 쓰는 걸 가정).
설정을 비워 두면 예전처럼 이 기기에만 저장돼요.
