import concurrent.futures
import requests
from requests_ntlm import HttpNtlmAuth


def send_req(name):
    try:
        session = requests.Session()
        session.auth = HttpNtlmAuth(username="", password="")
        response = session.get("")
        return response.status_code
    except Exception as e:
        return str(e)


# Press the green button in the gutter to run the script.
if __name__ == '__main__':
    num_req = 1000  # number of requests to send
    concurrent_req = 25  # requests to send concurrently
    with concurrent.futures.ThreadPoolExecutor(max_workers=concurrent_req) as exect:
        results = list(exect.map(send_req(), range(num_req)))
    print(results)
