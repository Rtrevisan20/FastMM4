{

Fast Memory Manager: Messages

belarussian translation by dzmitry[li]
mailto:dzmitry@biz.by
����������� ����� ������ ˳��


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
  MemoryDumpMsg = #13#10#13#10'������ ���� ������ � 256 ���� ���������� � ������ ';
  {Block Error Messages}
  BlockScanLogHeader = 'Allocated block logged by LogAllocatedBlocksToFile. The size is: ';
  ErrorMsgHeader = 'FastMM ���Ⳣ ������� ������ ';
  GetMemMsg = 'GetMem';
  FreeMemMsg = 'FreeMem';
  ReallocMemMsg = 'ReallocMem';
  BlockCheckMsg = '���������� ����������� �����';
  OperationMsg = ' ��������. ';
  BlockHeaderCorruptedMsg = '��������� ����� ����������. ';
  BlockFooterCorruptedMsg = 'ͳ���� ������ ����� ����������. ';
  FreeModifiedErrorMsg = 'FastMM ���Ⳣ ��� ���� ��� ������������ ����� ��� ����������. ';
  FreeModifiedDetailMsg = #13#10#13#10'Modified byte offsets (and lengths): ';
  DoubleFreeErrorMsg = '���� ��������� ������ ��������/������������ ���������� ����.';
  WrongMMFreeErrorMsg = 'An attempt has been made to free/reallocate a block that was allocated through a different FastMM instance. Check your memory manager sharing settings.';
  PreviousBlockSizeMsg = #13#10#13#10'����� ����������� ����� ���: ';
  CurrentBlockSizeMsg = #13#10#13#10'����� �����: ';
  PreviousObjectClassMsg = #13#10#13#10'���� ��� ����� ���������� ��� ��''���� �����: ';
  CurrentObjectClassMsg = #13#10#13#10'���� � ��������� ��� ��������������� ��� ��''���� �����: ';
  PreviousAllocationGroupMsg = #13#10#13#10'The allocation group was: ';
  PreviousAllocationNumberMsg = #13#10#13#10'The allocation number was: ';
  CurrentAllocationGroupMsg = #13#10#13#10'The allocation group is: ';
  CurrentAllocationNumberMsg = #13#10#13#10'The allocation number is: ';
  BlockErrorMsgTitle = '��������� ������� ������.';
  VirtualMethodErrorHeader = 'FastMM ���Ⳣ ������ �������� ��������� ����� ����������� ��''����. ����� ����� �������� ��������� ������� ��� ����������� ������� ��������.';
  InterfaceErrorHeader = 'FastMM ���Ⳣ ������ ����������� ��������� ����������� ��''����. ����� ����� �������� ��������� ������� ��� ����������� ������� ��������.';
  BlockHeaderCorruptedNoHistoryMsg = ' ������ ��������� ����� ���������� � ������� �� ���������.';
  FreedObjectClassMsg = #13#10#13#10'���� ����������� ��''����: ';
  VirtualMethodName = #13#10#13#10'³�������� �����: ';
  VirtualMethodOffset = '�������� +';
  VirtualMethodAddress = #13#10#13#10'����� ����������� ������: ';
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
  AlreadyInstalledMsg = 'FastMM4 ��� ����������.';
  AlreadyInstalledTitle = '��� ����������.';
  OtherMMInstalledMsg = 'FastMM4 �� ���� ���� ���������� ��� ����������� ����� ��������� ������.'
    + #13#10'��� �� ������� ������������� FastMM4, ��� ����� ���������� ��� FastMM4.pas �''�������� ����� ������ ������� �'
    + #13#10'������ "uses" ������ ''s .dpr ����� �������.';
  OtherMMInstalledTitle = '��������� ���������� FastMM4 - ��� ���������� ���� �������� ������.';
  MemoryAllocatedMsg = 'FastMM4 ��������� ���������� ��� ������ ��� ���� '
    + '��������� ����������� ���������� ������.'#13#10'FastMM4.pas ��²��� '
    + '���� ������ ������� � ����� �����''s .dpr ����� �������, ����� ������ ���� '
    + '���� ��������'#13#10'���� ���������� �������� ������ ����� ��� �� FastMM4 '
    + '������� ��������. '#13#10#13#10'��� �� ������������ ���������� ����������� '
    + '���� MadExcept (��� ����� ����� �������, ���� ��������� ������� ������������ '
    + '�������),'#13#10'�� ��������� � �������� ��� ������������ � ����������, ��� '
    + 'FastMM4.pas ������ ������������� ����� ����� ����� �������.';
  MemoryAllocatedTitle = '�� ������� ���������� FastMM4 - ������ ��� ���� ��������';
  {Leak checking messages}
  LeakLogHeader = '���� ������ ��� �������� � �� ���������. �����: ';
  LeakMessageHeader = '� ����� �������� ���������� ����� ������. ';
  SmallLeakDetail = '����� ����� ������ ������'
{$ifdef HideExpectedLeaksRegisteredByPointer}
    + ' (���������� ������� ����� �������������� �� ������������)'
{$endif}
    + ':'#13#10;
  LargeLeakDetail = '������ ������ ����� ��������� ������'
{$ifdef HideExpectedLeaksRegisteredByPointer}
    + ' (���������� ������� ����� �������������� �� ������������)'
{$endif}
    + ': ';
  BytesMessage = ' �����: ';
  AnsiStringBlockMessage = 'AnsiString';
  UnicodeStringBlockMessage = 'UnicodeString';
  LeakMessageFooter = #13#10
{$ifndef HideMemoryLeakHintMessage}
    + #13#10'Note: '
  {$ifdef RequireIDEPresenceForLeakReporting}
    + '����� �������� ����� ������ ����������� ����� � ������� ����������� ����� Delphi �� ��� �� ���������. '
  {$endif}
  {$ifdef FullDebugMode}
    {$ifdef LogMemoryLeakDetailToFile}
    + '�������� ���������� �� ������� ������ ����������� � �������� ���� � ��� �� ��������, ��� � ��������. '
    {$else}
    + '�������� "LogMemoryLeakDetailToFile" ��� ��������� �������, �� ������� �������� ���������� �� ������� ������. '
    {$endif}
  {$else}
    + '��� ��������� �������, �� ������� �������� ���������� �� ������� ������, �������� ����� ��������� "FullDebugMode" � "LogMemoryLeakDetailToFile". '
  {$endif}
    + '��� ���������� ����� �������� ����� ������, ��������� �������� "EnableMemoryLeakReporting".'#13#10
{$endif}
    + #0;
  LeakMessageTitle = '�������� ������ ������';
{$ifdef UseOutputDebugString}
  FastMMInstallMsg = 'FastMM ��� ����������.';
  FastMMInstallSharedMsg = 'Sharing an existing instance of FastMM.';
  FastMMUninstallMsg = 'FastMM ��� �������������.';
  FastMMUninstallSharedMsg = 'Stopped sharing an existing instance of FastMM.';
{$endif}
{$ifdef DetectMMOperationsAfterUninstall}
  InvalidOperationTitle = 'MM �������� ����� ������������.';
  InvalidGetMemMsg = 'FastMM ��������, ��� GetMem ��������� ����� ���� �� FastMM ��� �������������.';
  InvalidFreeMemMsg = 'FastMM ��������, ��� FreeMem ��������� ����� ���� �� FastMM ��� �������������.';
  InvalidReallocMemMsg = 'FastMM ��������, ��� ReallocMem ��������� ����� ���� �� FastMM ��� �������������.';
  InvalidAllocMemMsg = 'FastMM ��������, ��� ReallocMem ��������� ����� ���� �� FastMM ��� �������������.';
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
