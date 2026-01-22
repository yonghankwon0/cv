#!/bin/bash
# CV 업데이트 스크립트
# main.tex 컴파일 후 GitHub Pages에 자동 업로드

set -e

CV_DIR="/Users/kwon-yonghan/Documents/important"
REPO_DIR="/Users/kwon-yonghan/Documents/important/cv"

echo "=== CV 업데이트 시작 ==="

# 1. LaTeX 컴파일
echo "[1/4] main.tex 컴파일 중..."
cd "$CV_DIR"
xelatex -interaction=nonstopmode main.tex > /dev/null 2>&1
echo "      컴파일 완료!"

# 2. PDF 복사
echo "[2/4] PDF 복사 중..."
cp "$CV_DIR/main.pdf" "$REPO_DIR/cv.pdf"
echo "      복사 완료!"

# 3. Git commit
echo "[3/4] Git commit 중..."
cd "$REPO_DIR"
git add cv.pdf
git commit -m "Update CV - $(date '+%Y-%m-%d %H:%M')" > /dev/null 2>&1 || echo "      (변경사항 없음)"

# 4. Git push
echo "[4/4] GitHub에 업로드 중..."
git push origin main > /dev/null 2>&1
echo "      업로드 완료!"

echo ""
echo "=== CV 업데이트 완료 ==="
echo "URL: https://yonghankwon0.github.io/cv/cv.pdf"
