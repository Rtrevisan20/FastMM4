{

Fast Memory Manager: Messages

Czech translation by Rene Mihula.

Modifications:
25.04.2005  rm       Added resource strings for FastMM v4.64 compilability
01.03.2007  rm       Corrections of keying mistakes
17.03.2007  rm       Update to version FastMM v4.90
}

unit FastMM4Messages;

interface

{$Include FastMM4Options.inc}

const
  {The name of the debug info support DLL}
  FullDebugModeLibraryName32Bit = 'FastMM_FullDebugMode.dll';
  FullDebugModeLibraryName64Bit = 'FastMM_FullDebugMode64.dll';
  {Event log strings}
  LogFileExtension = '_MemoryManager_EventLog.txt'#0;
  CRLF = #13#10;
  EventSeparator = '--------------------------------';
  {Class name messages}
  UnknownClassNameMsg = 'Nezn�m� t��da';
  {Memory dump message}
  MemoryDumpMsg = #13#10#13#10'V�pis prvn�ch 256 byt� pam�ti, kter� za��naj� na adrese ';
  {Block Error Messages}
  BlockScanLogHeader = 'Alokovan� bloky byly zalogov�ny pomoc� LogAllocatedBlocksToFile. Velikost je: ';
  ErrorMsgHeader = 'FastMM detekoval chyby b�hem operace ';
  GetMemMsg = 'GetMem';
  FreeMemMsg = 'FreeMem';
  ReallocMemMsg = 'ReallocMem';
  BlockCheckMsg = 'hled�n� pr�zdn�ch blok�';
  OperationMsg = ' . ';
  BlockHeaderCorruptedMsg = 'Hlavi�ka bloku byla po�kozena. ';
  BlockFooterCorruptedMsg = 'Pati�ka bloku byla po�kozena. ';
  FreeModifiedErrorMsg = 'FastMM detekoval modifikaci bloku po jeho uvoln�n�. ';
  FreeModifiedDetailMsg = #13#10#13#10'Modified byte offsets (and lengths): ';
  DoubleFreeErrorMsg = 'Prob�hl pokus o uvoln�n� / realokaci ji� uvoln�n�ho bloku.';
  WrongMMFreeErrorMsg = 'An attempt has been made to free/reallocate a block that was allocated through a different FastMM instance. Check your memory manager sharing settings.';
  PreviousBlockSizeMsg = #13#10#13#10'P�edchoz� velikost bloku: ';
  CurrentBlockSizeMsg = #13#10#13#10'Velikost bloku: ';
  PreviousObjectClassMsg = #13#10#13#10'Blok byl ji� vyu�it pro objekt typu: ';
  CurrentObjectClassMsg = #13#10#13#10'Blok je aktu�ln� vyu��v�n pro objekt typu: ';
  PreviousAllocationGroupMsg = #13#10#13#10'Aloka�n� skupina byla: '; //
  PreviousAllocationNumberMsg = #13#10#13#10'Aloka�n� ��slo bylo: ';
  CurrentAllocationGroupMsg = #13#10#13#10'Aloka�n� skupina je: ';
  CurrentAllocationNumberMsg = #13#10#13#10'Aloka�n� ��slo je: ';
  BlockErrorMsgTitle = 'Detekov�na chyba pr�ce s pam�t�';
  VirtualMethodErrorHeader = 'FastMM detekoval pokus o vol�n� virtu�ln� metody ji� uvoln�n�ho objektu. Pro ukon�en� t�to operace bude nyn� vyhozena vyj�mka (access violation).';
  InterfaceErrorHeader = 'FastMM detekoval pokus o p��stup k interface ji� uvoln�n�ho objektu. Pro ukon�en� t�to operace bude nyn� vyhozena vyj�mka (access violation).';
  BlockHeaderCorruptedNoHistoryMsg = ' Historie je nedostupn� z d�vodu po�kozen� hlavi�ky bloku.';
  FreedObjectClassMsg = #13#10#13#10'Typ uvol�ovan�ho objektu: ';
  VirtualMethodName = #13#10#13#10'N�zev virtu�ln� metody: ';
  VirtualMethodOffset = 'Offset +';
  VirtualMethodAddress = #13#10#13#10'Adresa virtu�ln� metody: ';
  {Stack trace messages}
  CurrentThreadIDMsg = #13#10#13#10'ID aktivn�ho vl�kna (thread ID) je 0x';
  CurrentStackTraceMsg = ' a stav na z�sobn�ku vol�n� (n�vratov� adresy) je n�sleduj�c�:';
  ThreadIDPrevAllocMsg = #13#10#13#10'Tento blok byl ji� jednou alokov�n vl�knem 0x';
  ThreadIDAtAllocMsg = #13#10#13#10'Tento blok byl alokov�n vl�knem 0x';
  ThreadIDAtFreeMsg = #13#10#13#10'Blok ji� byl jednou uvoln�n vl�knem 0x';
  ThreadIDAtObjectAllocMsg = #13#10#13#10'Objekt byl alokov�n vl�knem 0x';
  ThreadIDAtObjectFreeMsg = #13#10#13#10'Objekt byl opakovan� uvoln�n vl�knem 0x';
  StackTraceMsg = ' v okam�iku, kdy z�sobn�k vol�n� obsahoval tyto n�vratov� adresy:';
  {Installation Messages}
  AlreadyInstalledMsg = 'FastMM4 ji� byl nainstalov�n.';
  AlreadyInstalledTitle = 'Nainstalov�no.';
  OtherMMInstalledMsg = 'FastMM4 nemohl b�t nainstalov�n, proto�e jin� memory '
    + 'manager (MM t�et� strany) ji� byl nainstalov�n.'#13#10'Pro pou�it� FastMM4 '
    + 'zkontrolujte, zda je unita FastMM4.pas prvn� unitou v sekci "uses" tohoto '
    + 'projektu (.dpr soubor).';
  OtherMMInstalledTitle = 'Nelze nainstalovat FastMM4 - Jin� memory manager je ji� nainstalov�n';
  MemoryAllocatedMsg = 'FastMM4 nemohl b�t nainstalov�n, proto�e jin� memory '
    + 'manager (standardn� MM) ji� byl nainstalov�n.'#13#10'Pro pou�it� FastMM4 '
    + 'zkontrolujte, zda je unita FastMM4.pas prvn� unitou v sekci "uses" tohoto '
    + 'projektu (.dpr soubor).'#13#10#13#10
    + 'Pokud pou��v�te n�jak� exception trapper (nap�. MadExcept) nebo libovoln� '
    + 'jin� n�stroj, kter� modifikuje po�ad� sekc� initialization, nakonfigurujte '
    + 'jej tak, aby unita FastMM4.pas byla inicializov�na p�ed v�emi ostatn�mi unitami.';
  MemoryAllocatedTitle = 'Nelze nainstalovat FastMM4 - Pam� ji� byla alokov�na';
  {Leak checking messages}
  LeakLogHeader = 'Blok pam�ti z�stal neuvoln�n. Velikost(i): ';
  LeakMessageHeader = 'Aplikace neuvolnila pou��vanou pam�. ';
  SmallLeakDetail = 'Bloky mal� velikosti'
{$ifdef HideExpectedLeaksRegisteredByPointer}
    + ' (vyjma chyb registrovan�ch pomoc� ukazatel�)'
{$endif}
    + ':'#13#10;
  LargeLeakDetail = 'Bloky st�edn� a velk� velikosti'
{$ifdef HideExpectedLeaksRegisteredByPointer}
    + ' (vyjma chyb registrovan�ch pomoc� ukazatel�)'
{$endif}
    + ': ';
  BytesMessage = ' byt�: ';
  AnsiStringBlockMessage = 'AnsiString';
  UnicodeStringBlockMessage = 'UnicodeString';
  LeakMessageFooter = #13#10
{$ifndef HideMemoryLeakHintMessage}
    + #13#10'Pozn�mka: '
  {$ifdef RequireIDEPresenceForLeakReporting}
    + 'Kontrola neuvoln�n� pam�ti je prov�d�na pouze pokud je prost�ed� Delphi aktivn� na tomt� syst�mu. '
  {$endif}
  {$ifdef FullDebugMode}
    {$ifdef LogMemoryLeakDetailToFile}
    + 'Detailn� informace o neuvoln�n� pam�ti jsou zaps�ny do textov�ho souboru v adres��i aplikace. '
    {$else}
    + 'Povolen�m direktivy "LogMemoryLeakDetailToFile" lze do souboru logu zapsat detailn� informace o neuvoln�n� pam�ti. '
    {$endif}
  {$else}
    + 'Pro z�sk�n� logu s detailn�mi informacemi o neuvoln�n� pam�ti je pot�eba povolit direktivy "FullDebugMode" a "LogMemoryLeakDetailToFile". '
  {$endif}
    + 'Vypnut�m direktivy "EnableMemoryLeakReporting" lze deaktivovat tuto kontrolu neuvoln�n� pam�ti.'#13#10
{$endif}
    + #0;
  LeakMessageTitle = 'Byla detekov�na neuvoln�n� pam� (Memory Leak)';
{$ifdef UseOutputDebugString}
  FastMMInstallMsg = 'FastMM byl nata�en.';
  FastMMInstallSharedMsg = 'Sd�len� existuj�c� instance FastMM.';
  FastMMUninstallMsg = 'FastMM byl odinstalov�n.';
  FastMMUninstallSharedMsg = 'Zastaveno sd�len� existuj�c� instance FastMM.';
{$endif}
{$ifdef DetectMMOperationsAfterUninstall}
  InvalidOperationTitle = 'Detekce MM vol�n� po odinstalov�n� FastMM.';
  InvalidGetMemMsg = 'FastMM detekoval vol�n� GetMem, kter� prob�hlo po odinstalaci FastMM.';
  InvalidFreeMemMsg = 'FastMM detekoval vol�n� FreeMem, kter� prob�hlo po odinstalaci FastMM.';
  InvalidReallocMemMsg = 'FastMM detekoval vol�n� ReallocMem, kter� prob�hlo po odinstalaci FastMM.';
  InvalidAllocMemMsg = 'FastMM detekoval vol�n� ReallocMem, kter� prob�hlo po odinstalaci FastMM.';
{$endif}

{$ifdef LogLockContention}
  LockingReportTitle = 'Locking Report';
{$endif}
{$ifdef LogLockContention}
  LockingReportHeader = 'Top locking contention sites';
{$endif}
{$ifdef UseReleaseStack}
{$ifdef DebugReleaseStack}
  ReleaseStackUsageHeader = 'Release stack usage statistics';
{$endif}
{$endif}
{$ifdef UseReleaseStack}
{$ifdef DebugReleaseStack}
  ReleaseStackUsageSmallBlocksMsg1 = 'Small blocks [';
{$endif}
{$endif}
{$ifdef UseReleaseStack}
{$ifdef DebugReleaseStack}
  ReleaseStackUsageSmallBlocksMsg2 = ']: ';
{$endif}
{$endif}
{$ifdef UseReleaseStack}
{$ifdef DebugReleaseStack}
  ReleaseStackUsageTotalSmallBlocksMsg = 'Total small blocks: ';
{$endif}
{$endif}
{$ifdef UseReleaseStack}
{$ifdef DebugReleaseStack}
  ReleaseStackUsageMediumBlocksMsg = 'Medium blocks: ';
{$endif}
{$endif}
{$ifdef UseReleaseStack}
{$ifdef DebugReleaseStack}
  ReleaseStackUsageLargeBlocksMsg = 'Large blocks: ';
{$endif}
{$endif}
{$ifdef UseReleaseStack}
{$ifdef DebugReleaseStack}
  ReleaseStackUsageTotalMemoryMsg = 'Total memory: ';
{$endif}
{$endif}
{$ifdef UseReleaseStack}
{$ifdef DebugReleaseStack}
  ReleaseStackUsageBuffers1Msg = ' in ';
{$endif}
{$endif}
{$ifdef UseReleaseStack}
{$ifdef DebugReleaseStack}
  ReleaseStackUsageBuffers2Msg = ' buffers [';
{$endif}
{$endif}

implementation

end.

