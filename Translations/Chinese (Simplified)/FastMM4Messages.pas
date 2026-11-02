{

Fast Memory Manager: Messages

Simplified Chinese translation by JiYuan Xie.

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
  UnknownClassNameMsg = 'δ֪';
  {Memory dump message}
  MemoryDumpMsg = #13#10#13#10'��ָ����ָ��ַ��ʼ, 256 ���ֽڵ��ڴ浱ǰ������ ';
  {Block Error Messages}
  BlockScanLogHeader = '�� LogAllocatedBlocksToFile ��¼���ѷ����ڴ��. ��С��: ';
  ErrorMsgHeader = 'FastMM �Ѽ�⵽һ������, ��ʱ���ڽ��� ';
  GetMemMsg = 'GetMem';
  FreeMemMsg = 'FreeMem';
  ReallocMemMsg = 'ReallocMem';
  BlockCheckMsg = 'ɨ�������ڴ��';
  OperationMsg = ' ����. ';
  BlockHeaderCorruptedMsg = '�ڴ��ͷ�������ѱ��ƻ�. ';
  BlockFooterCorruptedMsg = '�ڴ��β�������ѱ��ƻ�. ';
  FreeModifiedErrorMsg = 'FastMM ��⵽�����ͷ��ڴ�����ݵ��޸�. ';
  FreeModifiedDetailMsg = #13#10#13#10'���޸��ֽڵ�ƫ�Ƶ�ַ(�Լ�����): ';
  DoubleFreeErrorMsg = '��ͼ�ͷ�/���·���һ����δ������ڴ��.';
  WrongMMFreeErrorMsg = 'An attempt has been made to free/reallocate a block that was allocated through a different FastMM instance. Check your memory manager sharing settings.';
  PreviousBlockSizeMsg = #13#10#13#10'�ϴ�ʹ��ʱ���ڴ���С��: ';
  CurrentBlockSizeMsg = #13#10#13#10'�ڴ��Ĵ�С��: ';
  PreviousObjectClassMsg = #13#10#13#10'���ڴ���ϴα�����һ������������Ķ���: ';
  CurrentObjectClassMsg = #13#10#13#10'���ڴ�鵱ǰ������һ������������Ķ���: ';
  PreviousAllocationGroupMsg = #13#10#13#10'��������: ';
  PreviousAllocationNumberMsg = #13#10#13#10'���������: ';
  CurrentAllocationGroupMsg = #13#10#13#10'��������: ';
  CurrentAllocationNumberMsg = #13#10#13#10'���������: ';
  BlockErrorMsgTitle = '��⵽�ڴ����';
  VirtualMethodErrorHeader = 'FastMM ��⵽�����ͷŶ�����鷽���ĵ���. һ�����ʳ�ͻ�쳣���ڽ�����������ֹ��ǰ�Ĳ���.';
  InterfaceErrorHeader = 'FastMM ��⵽�����ͷŶ���Ľӿڵ�ʹ��. һ�����ʳ�ͻ�쳣���ڽ�����������ֹ��ǰ�Ĳ���.';
  BlockHeaderCorruptedNoHistoryMsg = ' ���ҵ�, �����ڴ��ͷ���������ѱ��ƻ�, �޷��õ����ڴ���ʹ����ʷ.';
  FreedObjectClassMsg = #13#10#13#10'���ͷŵĶ�����������: ';
  VirtualMethodName = #13#10#13#10'�鷽��: ';
  VirtualMethodOffset = 'ƫ�Ƶ�ַ +';
  VirtualMethodAddress = #13#10#13#10'�鷽���ĵ�ַ: ';
  {Stack trace messages}
  CurrentThreadIDMsg = #13#10#13#10'��ǰ�̵߳� ID �� 0x';
  CurrentStackTraceMsg = ', ���¸ô���Ķ�ջ����(���ص�ַ): ';
  ThreadIDPrevAllocMsg = #13#10#13#10'���ڴ����һ�η������߳� 0x';
  ThreadIDAtAllocMsg = #13#10#13#10'���ڴ��������߳� 0x';
  ThreadIDAtFreeMsg = #13#10#13#10'���ڴ����һ���ͷ����߳� 0x';
  ThreadIDAtObjectAllocMsg = #13#10#13#10'�ö���������߳� 0x';
  ThreadIDAtObjectFreeMsg = #13#10#13#10'�ö�������ͷ����߳� 0x';
  StackTraceMsg = ', ��ʱ�Ķ�ջ����(���ص�ַ): ';
  {Installation Messages}
  AlreadyInstalledMsg = 'FastMM4 �Ѿ�����װ';
  AlreadyInstalledTitle = '�Ѿ�����';
  OtherMMInstalledMsg = 'FastMM4 �޷�����װ, ��Ϊ�����������ڴ�������������а�װ.'
    + #13#10'�������ʹ�� FastMM4, ��ȷ��������Ŀ�� .dpr �ļ��� "uses" ������, '
    + #13#10'FastMM4.pas �ǵ�һ����ʹ�õĵ�Ԫ.';
  OtherMMInstalledTitle = '�޷���װ FastMM4 - �����ڴ���������ȱ���װ';
  MemoryAllocatedMsg = 'FastMM4 �޷���װ, ��Ϊ��ǰ��ͨ��Ĭ���ڴ�������������ڴ�.'
    + #13#10'FastMM4.pas ����������Ŀ�� .dpr �ļ��е�һ����ʹ�õĵ�Ԫ, ���������'
    + #13#10'FastMM4 �õ�����Ȩ֮ǰ, Ӧ�ó����Ѿ�ͨ��Ĭ���ڴ�������������ڴ�.'
    + #13#10#13#10'�����ʹ�����쳣��׽����, �� MadExcept(���κν��޸ĵ�Ԫ��ʼ��˳��Ĺ���),'
    + #13#10'�뵽��������ҳ��,ȷ�� FastMM4.pas ��Ԫ���κ�������Ԫ֮ǰ����ʼ��.';
  MemoryAllocatedTitle = '�޷���װ FastMM4 - ֮ǰ�Ѿ��������ڴ�';
  {Leak checking messages}
  LeakLogHeader = 'һ���ڴ����й¶. ��С��: ';
  LeakMessageHeader = '���Ӧ�ó�������ڴ�й¶. ';
  SmallLeakDetail = 'С�ڴ���й¶��'
{$ifdef HideExpectedLeaksRegisteredByPointer}
    + ' (�������Ѱ�ָ��ע���Ԥ֪й¶)'
{$endif}
    + ':'#13#10;
  LargeLeakDetail = '��й¶���еȼ����ڴ��Ĵ�С��'
{$ifdef HideExpectedLeaksRegisteredByPointer}
    + ' (�������Ѱ�ָ��ע���Ԥ֪й¶)'
{$endif}
    + ': ';
  BytesMessage = ' �ֽ�: ';
  AnsiStringBlockMessage = 'AnsiString';
  UnicodeStringBlockMessage = 'UnicodeString';
  LeakMessageFooter = #13#10
{$ifndef HideMemoryLeakHintMessage}
    + #13#10'ע��: '
  {$ifdef RequireIDEPresenceForLeakReporting}
    + 'ֻ�е� Delphi ͬʱ������ͬһ�������ʱ�Ż�����ڴ�й¶���. '
  {$endif}
  {$ifdef FullDebugMode}
    {$ifdef LogMemoryLeakDetailToFile}
    + '�ڴ�й¶����ϸ��Ϣ�Ѿ�����¼���뱾Ӧ�ó���ͬһĿ¼�µ�һ���ı��ļ���. '
    {$else}
    + '������ "LogMemoryLeakDetailToFile" �������뿪���Եõ�һ�����������ڴ�й¶����ϸ��Ϣ����־�ļ�. '
    {$endif}
  {$else}
    + 'Ҫ�õ�һ�����������ڴ�й¶����ϸ��Ϣ����־�ļ�, ������ "FullDebugMode" �� "LogMemoryLeakDetailToFile" �������뿪��. '
  {$endif}
    + 'Ҫ��ֹ�ڴ�й¶���, ��ر� "EnableMemoryLeakReporting" �������뿪��.'#13#10
{$endif}
    + #0;
  LeakMessageTitle = '��⵽�ڴ�й¶';
{$ifdef UseOutputDebugString}
  FastMMInstallMsg = 'FastMM �ѱ���װ.';
  FastMMInstallSharedMsg = '������һ���Ѵ��ڵ� FastMM ʵ��.';
  FastMMUninstallMsg = 'FastMM �ѱ�ж��.';
  FastMMUninstallSharedMsg = '��ֹͣ����һ���Ѵ��ڵ� FastMM ʵ��.';
{$endif}
{$ifdef DetectMMOperationsAfterUninstall}
  InvalidOperationTitle = 'ж��֮������ MM ����.';
  InvalidGetMemMsg = 'FastMM ��⵽�� FastMM ��ж��֮������� GetMem.';
  InvalidFreeMemMsg = 'FastMM ��⵽�� FastMM ��ж��֮������� FreeMem.';
  InvalidReallocMemMsg = 'FastMM ��⵽�� FastMM ��ж��֮������� ReallocMem.';
  InvalidAllocMemMsg = 'FastMM ��⵽�� FastMM ��ж��֮������� AllocMem.';
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

