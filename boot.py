import requests, base64, os, threading, time

# Baixar token do Gist secreto
print('🔑 Obtendo token...')
try:
    token_url = 'https://gist.githubusercontent.com/gynbetfc/7af02df43a6b967eea94a35f375b7c10/raw/608a31383058bca19b28d480d97556c7cddff7a3/token.txt'
    TOKEN = requests.get(token_url, timeout=10).text.strip()
except:
    TOKEN = os.environ.get('GITHUB_TOKEN', '')

if not TOKEN:
    print('❌ Token nao encontrado!')
    exit(1)

print('📥 Baixando Tesla 369...')
url = 'https://api.github.com/repos/gynbetfc/v-sensitivo-bot/contents/main.py'
headers = {'Authorization': f'token {TOKEN}', 'Accept': 'application/vnd.github.v3+json'}
r = requests.get(url, headers=headers)

if r.status_code == 200:
    data = r.json()
    codigo = base64.b64decode(data['content']).decode('utf-8')
    
    def start_bot():
        exec(codigo)
    
    threading.Thread(target=start_bot, daemon=True).start()
    time.sleep(5)
    
    print('📱 Abrindo Chrome...')
    os.system('am start -a android.intent.action.VIEW -d http://localhost:5000')
    print('✅ Pronto!')
else:
    print(f'❌ Erro: {r.status_code}')
