# CHT_VM_Proxy
解決在中華電信 OA 網路下，Linux Ubuntu 虛擬機 VM 無法透過 CHT Proxy 上網問題

## 若您在中華電信 OA 網段內，透過 Virtual Box 或 VMware Player 來開啟 VM，您必須在此 VM 內透過 Terminal 執行以下指令：
```bash
sudo curl -x "http://10.160.3.88:8080/" -sL "https://raw.githubusercontent.com/oneleo/vm_with_cht-oa-proxy/master/chtproxy.bash" | sudo bash -x
```
或是使用縮址的版本
```bash
sudo curl -x "http://10.160.3.88:8080/" -sL "https://pse.is/QZXFG" | sudo bash -x
```

- 註：這邊主要設置 VM 的 Proxy 為中華電信的 [http://10.160.3.88:8080/](http://10.160.3.88:8080/)，若您需使用不同的 Proxy，請下載並自行修改 [chtproxy.bash](https://github.com/oneleo/vm_with_cht-oa-proxy/blob/master/chtproxy.bash) 檔內的 Proxy IP 及 Port 

## 執行完以上其中一個指令後就可以進行 apt-get install 及 docker run 測試
```bash
sudo apt-get install vim -y
docker run busybox echo "hello world"
```

## License
THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.

