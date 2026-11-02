{

Fast Memory Manager: Messages

2006-07-18
Ukrainian translation by Andrey V. Shtukaturov.

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
  UnknownClassNameMsg = 'Unknown';
  {Memory dump message}
  MemoryDumpMsg = #13#10#13#10'�������� ���� ��쒒�� � 256 ���� ��������� � ������ ';
  {Block Error Messages}
  BlockScanLogHeader = ' �������� ���� ���������������� ���������� LogAllocatedBlocksToFile. �����: ';
  ErrorMsgHeader = 'FastMM ������ ������� �� ��� ';
  GetMemMsg = 'GetMem';
  FreeMemMsg = 'FreeMem';
  ReallocMemMsg = 'ReallocMem';
  BlockCheckMsg = '���������� ���������� ����� ';
  OperationMsg = ' ��������. ';
  BlockHeaderCorruptedMsg = ' ��������� ����� ����������. ';
  BlockFooterCorruptedMsg = ' ����� ������� ����� ���������. ';
  FreeModifiedErrorMsg = 'FastMM ������ �� ���� ���� ������������ ���� ���� ���������. ';
  FreeModifiedDetailMsg = #13#10#13#10'Modified byte offsets (and lengths): ';
  DoubleFreeErrorMsg = ' ���� ������ ��������/����������� �� �������� ����.';
  WrongMMFreeErrorMsg = 'An attempt has been made to free/reallocate a block that was allocated through a different FastMM instance. Check your memory manager sharing settings.';
  PreviousBlockSizeMsg = #13#10#13#10'����� ������������ ����� ���: ';
  CurrentBlockSizeMsg = #13#10#13#10'����� �����: ';
  PreviousObjectClassMsg = #13#10#13#10'���� ��� ������ ������������ ��� �ᒒ���� �����: ';
  CurrentObjectClassMsg = #13#10#13#10'���� �� ����� ������ ��������������� ��� �ᒒ���� �����: ';
  PreviousAllocationGroupMsg = #13#10#13#10'������� ����� ����: ';
  PreviousAllocationNumberMsg = #13#10#13#10'�������� ����� ���: ';
  CurrentAllocationGroupMsg = #13#10#13#10'������� ����� �����: ';
  CurrentAllocationNumberMsg = #13#10#13#10'�������� ����� ����: ';
  BlockErrorMsgTitle = '�������� ������� ��쒒��.';
  VirtualMethodErrorHeader = 'FastMM ������ ������ ��������� ���������� ����� ���������� �ᒒ����. ����� ���� ��������� ��������� ������� ��� ����������� ������� ��������.';
  InterfaceErrorHeader = 'FastMM ������ ������ ����������� ��������� ���������� �ᒒ����. ����� ���� ��������� ��������� ������� ��� ����������� ������� ��������.';
  BlockHeaderCorruptedNoHistoryMsg = ' �� ���� ��������� ����� ���������� � ������ ����������.';
  FreedObjectClassMsg = #13#10#13#10'���� ���������� �ᒒ����: ';
  VirtualMethodName = #13#10#13#10'³��������� �����: ';
  VirtualMethodOffset = '���� +';
  VirtualMethodAddress = #13#10#13#10'������ ����������� ������: ';
  {Stack trace messages}
  CurrentThreadIDMsg = #13#10#13#10'The current thread ID is 0x';
  CurrentStackTraceMsg = ', and the stack trace (return addresses) leading to this error is:';
  ThreadIDPrevAllocMsg = #13#10#13#10'This block was previously allocated by thread 0x';
  ThreadIDAtAllocMsg = #13#10#13#10'This block was allocated by thread 0x';
  ThreadIDAtFreeMsg = #13#10#13#10'The block was previously freed by thread 0x';
  ThreadIDAtObjectAllocMsg = #13#10#13#10'The object was allocated by thread 0x';
  ThreadIDAtObjectFreeMsg = #13#10#13#10'The object was subsequently freed by thread 0x';
  StackTraceMsg = ', and the stack trace (return addresses) at the time was:';
  {Installation Messages}
  AlreadyInstalledMsg = 'FastMM4 ��� �����������.';
  AlreadyInstalledTitle = '��� �����������.';
  OtherMMInstalledMsg = 'FastMM4 �� ���� ���� ����������� ���� ��� ����������� ����� �������� ��쒒��.'
    + #13#10'���� �� ������ ��������������� FastMM4, ����-����� ������������� �� FastMM4.pas � ����� ������ ������� �'
    + #13#10'������ "uses" ������ .dpr ����� �������.';
  OtherMMInstalledTitle = '��������� ���������� FastMM4 - ��� ����������� ����� �������� ��쒒��.';
  MemoryAllocatedMsg = 'FastMM4 ��������� ���������� ���� ��쒒��� ��� ���� '
    + '������� ����������� ���������� ��쒒���.'#13#10'FastMM4.pas ������� '
    + '���� ������ ������� � ������ ���� .dpr ���� �������, ������ ��쒒��� ���� '
    + '���� �������'#13#10'����� ����������� �������� ��쒒�� ����� ��� �� FastMM4 '
    + '������ ��������. '#13#10#13#10'���� �� ������������� �������� ��������� ��������, '
    + '��������� MadExcept (��� ����-���� ����� ���������� �� �������� ������� ������������ '
    + '�������),'#13#10'��� �������� �� ������� ���� ������������ �� �������������, �� '
    + 'FastMM4.pas ������ ������������� ����� ����-���� ����� �������.';
  MemoryAllocatedTitle = '��������� ���������� FastMM4 - ��쒒��� ��� ���� �������';
  {Leak checking messages}
  LeakLogHeader = '���� ��쒒�� ��� �������� �� �� ���������. �����: ';
  LeakMessageHeader = '� ����� ������� ����������� ������ ��쒒��.';
  SmallLeakDetail = '������ ����� ���''�� ���������� ������'
{$ifdef HideExpectedLeaksRegisteredByPointer}
    + ' (�� �������� ���������� ����� ���''�� ������������� �� ���������)'
{$endif}
    + ':'#13#10;
  LargeLeakDetail = '������ ����� ����� ���''�� ���������� ������'
{$ifdef HideExpectedLeaksRegisteredByPointer}
    + ' (�� �������� ���������� ����� ���''�� ������������� �� ���������)'
{$endif}
    + ': ';
  BytesMessage = ' ����: ';
  AnsiStringBlockMessage = 'AnsiString';
  UnicodeStringBlockMessage = 'UnicodeString';
  LeakMessageFooter = #13#10
{$ifndef HideMemoryLeakHintMessage}
    + #13#10'Note: '
  {$ifdef RequireIDEPresenceForLeakReporting}
    + '�� �������� ������ ��쒒�� ���������� ���� � ������� ��������� ������ Delphi �� ���� � �������. '
  {$endif}
  {$ifdef FullDebugMode}
    {$ifdef LogMemoryLeakDetailToFile}
    + '�������� ���������� ��� ������ � ��쒒�� ������������ � ��������� ���� � ���� � �������, �� � �������. '
    {$else}
    + '�������� "LogMemoryLeakDetailToFile" ��� ���� ��� �������� ������, �� ������ �������� ���������� ��� ������ ��쒒��. '
    {$endif}
  {$else}
    + '��� ���� ��� �������� ������, �� ������ �������� ���������� ��� ������ ��쒒��, �������� ����� ��������� "FullDebugMode" �� "LogMemoryLeakDetailToFile". '
  {$endif}
    + '��� ���� ��� ��������� �� �������� ����� ��쒒��, ��������� �������� ���������� "EnableMemoryLeakReporting".'#13#10
{$endif}
    + #0;
  LeakMessageTitle = '�������� ������ ��쒒��';
{$ifdef UseOutputDebugString}
  FastMMInstallMsg = 'FastMM has been installed.';
  FastMMInstallSharedMsg = 'Sharing an existing instance of FastMM.';
  FastMMUninstallMsg = 'FastMM has been uninstalled.';
  FastMMUninstallSharedMsg = 'Stopped sharing an existing instance of FastMM.';
{$endif}
{$ifdef DetectMMOperationsAfterUninstall}
  InvalidOperationTitle = 'MM Operation after uninstall.';
  InvalidGetMemMsg = 'FastMM has detected a GetMem call after FastMM was uninstalled.';
  InvalidFreeMemMsg = 'FastMM has detected a FreeMem call after FastMM was uninstalled.';
  InvalidReallocMemMsg = 'FastMM has detected a ReallocMem call after FastMM was uninstalled.';
  InvalidAllocMemMsg = 'FastMM has detected a ReallocMem call after FastMM was uninstalled.';
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

