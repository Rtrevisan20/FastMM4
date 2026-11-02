{

Fast Memory Manager: Messages

French translation by Florent Ouchet.

}

unit FastMM4Messages;

interface

{$Include FastMM4Options.inc}

const
  {The name of the debug info support DLL}
  FullDebugModeLibraryName32Bit = 'FastMM_FullDebugMode.dll';
  FullDebugModeLibraryName64Bit = 'FastMM_FullDebugMode64.dll';
  {Event log strings}
  LogFileExtension = '_MemoryManager_Rapport.txt'#0;
  CRLF = #13#10;
  EventSeparator = '--------------------------------';
  {Class name messages}
  UnknownClassNameMsg = 'Inconnu';
  {Memory dump message}
  MemoryDumpMsg = #13#10#13#10'Contenu des 256 octets commen�ant � l''adresse ';
  {Block Error Messages}
  BlockScanLogHeader = 'Bloc allou� rapport� par LogAllocatedBlocksToFile. Sa taille est: ';
  ErrorMsgHeader = 'FastMM a d�tect� une erreur pendant un ';
  GetMemMsg = 'appel � GetMem';
  FreeMemMsg = 'appel � FreeMem';
  ReallocMemMsg = 'appel � ReallocMem';
  BlockCheckMsg = 'scan des blocs libres';
  OperationMsg = '. ';
  BlockHeaderCorruptedMsg = 'L''en-t�te du bloc a �t� corrompue. ';
  BlockFooterCorruptedMsg = 'La fin du bloc a �t� corrompue. ';
  FreeModifiedErrorMsg = 'FastMM a d�tect� qu''un bloc a �t� modifi� apr�s avoir �t� lib�r�. ';
  FreeModifiedDetailMsg = #13#10#13#10'Modified byte offsets (and lengths): ';
  DoubleFreeErrorMsg = 'Tentative d''appeler free ou reallocate pour un bloc d�j� lib�r�.';
  WrongMMFreeErrorMsg = 'An attempt has been made to free/reallocate a block that was allocated through a different FastMM instance. Check your memory manager sharing settings.';
  PreviousBlockSizeMsg = #13#10#13#10'La taille pr�c�dente du bloc �tait: ';
  CurrentBlockSizeMsg = #13#10#13#10'La taille du bloc est: ';
  PreviousObjectClassMsg = #13#10#13#10'Le bloc �tait pr�c�demment utilis� pour un objet de la classe: ';
  CurrentObjectClassMsg = #13#10#13#10'Le bloc �tait actuellement utilis� pour un objet de la classe: ';
  PreviousAllocationGroupMsg = #13#10#13#10'Le groupe d''allocations �tait: ';
  PreviousAllocationNumberMsg = #13#10#13#10'Le nombre d''allocations �tait: ';
  CurrentAllocationGroupMsg = #13#10#13#10'Le groupe d''allocation est: ';
  CurrentAllocationNumberMsg = #13#10#13#10'Le nombre d''allocations est: ';
  BlockErrorMsgTitle = 'Erreur m�moire d�tect�e';
  VirtualMethodErrorHeader = 'FastMM a d�tect� une tentative d''appel d''une m�thode virtuelle d''un objet lib�r�. Une violation d''acc�s va maintenant �tre lev�e dans le but d''annuler l''op�ration courante.';
  InterfaceErrorHeader = 'FastMM a d�tect� une tentative d''utilisation d''une interface d''un objet lib�r�. Une violation d''acc�s va maintenant �tre lev�e dans le but d''annuler l''op�ration courante.';
  BlockHeaderCorruptedNoHistoryMsg = ' La corruption de l''ent�te du bloc ne permet pas l''obtention de l''historique.';
  FreedObjectClassMsg = #13#10#13#10'Classe de l''objet lib�r�: ';
  VirtualMethodName = #13#10#13#10'M�thode virtuelle: ';
  VirtualMethodOffset = 'D�calage +';
  VirtualMethodAddress = #13#10#13#10'Adresse de la m�thode virtuelle: ';
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
  AlreadyInstalledMsg = 'FastMM4 est d�j� install�.';
  AlreadyInstalledTitle = 'D�j� install�.';
  OtherMMInstalledMsg = 'FastMM4 ne peut pas �tre install� puisqu''un autre gestionnaire de m�moire s''est d�j� install�.'#13#10
    + 'Pour utiliser FastMM4, FastMM4.pas doit �tre la toute premi�re unit� dans la section "uses" du fichier projet .dpr';
  OtherMMInstalledTitle = 'Impossible d''installer FastMM4 - un autre gestionnaire de m�moire est d�j� install�';
  MemoryAllocatedMsg = 'FastMM4 ne peut pas �tre install� puisque des blocs de m�moire ont d�j� �t� allou� par le gestionnaire de m�moire par d�faut.'#13#10
    + 'FastMM4.pas DOIT �tre la premi�re unit� dans la section "uses" du fichier projet .dpr; dans le cas contraire, des blocs de m�moire '#1310
    + 'peuvent �tre allou�s avant que FastMM4 ne prenne le contr�le, si vous utilisez un gestionnaire d''exception comme MadExcept '#1310
    + '(ou tout autre outil qui modifie l''ordre d''initialisation des unit�s). Veuillez modifier sur la page de configuration de cet outil'#1310
    + 'l''ordre d''initialisation des unit�s pour que FastMM4.pas soit initialis�e avant tout autre unit�';
  MemoryAllocatedTitle = 'Impossible d''installer FastMM4 - des blocs de m�moire ont d�j� �t� allou�s';
  {Leak checking messages}
  LeakLogHeader = 'Une fuite m�moire a �t� d�tect�e. Sa taille est: ';
  LeakMessageHeader = 'Cette application a fuit de la m�moire. ';
  SmallLeakDetail = 'Les fuites de petits blocs sont'
{$ifdef HideExpectedLeaksRegisteredByPointer}
    + ' (excluant toutes les fuites masqu�es)'
{$endif}
    + ':'#13#10;
  LargeLeakDetail = 'Les tailles des blocs moyens et grands sont'
{$ifdef HideExpectedLeaksRegisteredByPointer}
    + ' (excluant toutes les fuites masqu�es)'
{$endif}
    + ': ';
  BytesMessage = ' octets: ';
  AnsiStringBlockMessage = 'AnsiString';
  UnicodeStringBlockMessage = 'UnicodeString';
  LeakMessageFooter = #13#10
{$ifndef HideMemoryLeakHintMessage}
    + #13#10'Conseil: '
  {$ifdef RequireIDEPresenceForLeakReporting}
    + 'Cette v�rification des fuites m�moire n''est effectu� que si Delphi est actuellement ex�cut� sur la m�me machine. '
  {$endif}
  {$ifdef FullDebugMode}
    {$ifdef LogMemoryLeakDetailToFile}
    + 'Les d�tails des fuites de m�moire sont rapport�s dans un fichier texte dans le m�me r�pertoire que l''application. '
    {$else}
    + 'Activez l''option "LogMemoryLeakDetailToFile" pour obtenir un fichier rapportant les d�tails des fuites de m�moire. '
    {$endif}
  {$else}
    + 'Pour obtenir un fichier rapport contenant les d�tails des fuites de m�moire, activez les options de compilation "FullDebugMode" et "LogMemoryLeakDetailToFile". '
  {$endif}
    + 'Pour d�sactiver cette v�rification des fuites m�moires, d�sactivez l''option de compilation "EnableMemoryLeakReporting".'#13#10
{$endif}
    + #0;
  LeakMessageTitle = 'Fuite m�moire d�tect�e';
{$ifdef UseOutputDebugString}
  FastMMInstallMsg = 'FastMM a �t� install�.';
  FastMMInstallSharedMsg = 'Partageant un exemplaire existant de FastMM.';
  FastMMUninstallMsg = 'FastMM a �t� d�sinstall�.';
  FastMMUninstallSharedMsg = 'Fin du partage avec un exemplaire existant de FastMM.';
{$endif}
{$ifdef DetectMMOperationsAfterUninstall}
  InvalidOperationTitle = 'Operation MM apr�s la d�sinstallation.';
  InvalidGetMemMsg = 'FastMM a d�tect� un appel � GetMem apr�s que FastMM ait �t� d�sinstall�.';
  InvalidFreeMemMsg = 'FastMM a d�tect� un appel � FreeMem apr�s que FastMM ait �t� d�sinstall�.';
  InvalidReallocMemMsg = 'FastMM a d�tect� un appel � ReallocMem apr�s que FastMM ait �t� d�sinstall�.';
  InvalidAllocMemMsg = 'FastMM a d�tect� un appel � AllocMem apr�s que FastMM ait �t� d�sinstall�.';
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

