FROM docker-wine

# Ensure the directory is owned by wineuser
USER root
RUN chown -R wineuser:wineuser /wine

USER wineuser

# Download and install KakaoTalk
RUN mkdir -p /Data/kakaotalk && cd /Data/kakaotalk && \
    curl -O https://app-pc.kakaocdn.net/talk/win32/KakaoTalk_Setup.exe && \
    wine KakaoTalk_Setup.exe /S

# Configure Wine to use Nanum fonts for Korean language
RUN mkdir -p $WINEPREFIX/drive_c/windows/Fonts && \
    cp /usr/share/fonts/truetype/nanum/NanumGothic.ttf $WINEPREFIX/drive_c/windows/Fonts/

# Expose the DISPLAY environment variable for X11 forwarding
ENV DISPLAY=:0

ENTRYPOINT [ "wine", "C:\\Program Files\\Kakao\\KakaoTalk\\KakaoTalk.exe" ]
