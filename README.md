# win10-secure-baseline-gpo


To create a GPO backup from local policy:

```batch
bin\LGPO.exe /b "%cd%\GPO" /n "Win10 Secure Baseline"
```

import settings from one or more GPO backups under "path"

```batch
bin\LGPO.exe /g GPO
```

The following table describes all CSE GUIDs referenced by this GPO:

| GUID                                     | Description |
| ---------------------------------------- | ----------- |
| `{169EBF44-942F-4C43-87CE-13C93996EBBE}` | UE-V |
| `{29BBE2D5-DE47-4855-97D7-2745E166DC6D}` | Cortana search |
| `{2BFCC077-22D2-48DE-BDE1-2F618D9B476D}` | App-V |
| `{2D4156A2-897A-11DB-BA21-001185AD2B89}` | Network List Manager Policies MMC snap-in |
| `{35378EAC-683F-11D2-A89A-00C04FBBCFA2}` | Registry settings |
| `{7933F41E-56F8-41D6-A31C-4148A711EE93}` | Windows search |
| `{803E14A0-B4FB-11D0-A0D0-00A0C90F574B}` | Security settings MMC snap-in |
| `{827D319E-6EAC-11D2-A4EA-00C04F79F83A}` | Security (domain-only) |
| `{C631DF4C-088F-4156-B058-4375F0853CD8}` | Offline files |
| `{CDEAFC3D-948D-49DD-AB12-E578BA4AF7AA}` | TCP/IP |
| `{D02B1F72-3407-48AE-BA88-E8213C6761F1}` | Computer setting |
| `{D02B1F73-3407-48AE-BA88-E8213C6761F1}` | User setting |
| `{DF3DC19F-F72C-4030-940E-4C2A65A6B612}` | No idea |
| `[{F3CCC681-B74C-4060-9F26-CD84525DCA2A}{0F3F3735-573D-9804-99E4-AB2A69BA5FD4}]` | [Advanced audit policy configuration](https://msdn.microsoft.com/en-us/library/dd976882.aspx) |

`LGPO.exe /e audit` does not add the same GUID pair for Advanced Audit Policy
Configuration as gpedit. The value above is added by gpedit to
gPCMachineExtensionNames (only), whereas LGPO v2.2 adds
`[{F3CCC681-B74C-4060-9F26-CD84525DCA2A}{DF3DC19F-F72C-4030-940E-4C2A65A6B612}]`
to both gPCMachineExtensionNames and gPCUserExtensionNames. This is probably not
correct, and is another reason to avoid LGPO's CSE handling.

References

---

> [LGPO.exe - Local Group Policy Object Utility](https://docs.microsoft.com/en-us/archive/blogs/secguide/lgpo-exe-local-group-policy-object-utility-v1-0)
