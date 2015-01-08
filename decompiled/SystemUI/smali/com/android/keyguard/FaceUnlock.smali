.class public Lcom/android/keyguard/FaceUnlock;
.super Ljava/lang/Object;
.source "FaceUnlock.java"

# interfaces
.implements Landroid/os/Handler$Callback;
.implements Lcom/android/keyguard/BiometricSensorUnlock;


# instance fields
.field private final MSG_CANCEL:I

.field private final MSG_POKE_WAKELOCK:I

.field private final MSG_REPORT_FAILED_ATTEMPT:I

.field private final MSG_SERVICE_CONNECTED:I

.field private final MSG_SERVICE_DISCONNECTED:I

.field private final MSG_UNLOCK:I

.field private mBoundToService:Z

.field private mConnection:Landroid/content/ServiceConnection;

.field private final mContext:Landroid/content/Context;

.field private final mFaceUnlockCallback:Lcom/android/internal/policy/IFaceLockCallback;

.field private mFaceUnlockView:Landroid/view/View;

.field private mHandler:Landroid/os/Handler;

.field private volatile mIsRunning:Z

.field mKeyguardScreenCallback:Lcom/android/keyguard/KeyguardSecurityCallback;

.field private final mLockPatternUtils:Lcom/android/internal/widget/LockPatternUtils;

.field private mService:Lcom/android/internal/policy/IFaceLockInterface;

.field private mServiceRunning:Z

.field private final mServiceRunningLock:Ljava/lang/Object;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 2
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    const/4 v1, 0x0

    .line 75
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 48
    iput-boolean v1, p0, Lcom/android/keyguard/FaceUnlock;->mServiceRunning:Z

    .line 51
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/android/keyguard/FaceUnlock;->mServiceRunningLock:Ljava/lang/Object;

    .line 53
    iput-boolean v1, p0, Lcom/android/keyguard/FaceUnlock;->mBoundToService:Z

    .line 57
    iput v1, p0, Lcom/android/keyguard/FaceUnlock;->MSG_SERVICE_CONNECTED:I

    .line 58
    const/4 v0, 0x1

    iput v0, p0, Lcom/android/keyguard/FaceUnlock;->MSG_SERVICE_DISCONNECTED:I

    .line 59
    const/4 v0, 0x2

    iput v0, p0, Lcom/android/keyguard/FaceUnlock;->MSG_UNLOCK:I

    .line 60
    const/4 v0, 0x3

    iput v0, p0, Lcom/android/keyguard/FaceUnlock;->MSG_CANCEL:I

    .line 61
    const/4 v0, 0x4

    iput v0, p0, Lcom/android/keyguard/FaceUnlock;->MSG_REPORT_FAILED_ATTEMPT:I

    .line 62
    const/4 v0, 0x5

    iput v0, p0, Lcom/android/keyguard/FaceUnlock;->MSG_POKE_WAKELOCK:I

    .line 67
    iput-boolean v1, p0, Lcom/android/keyguard/FaceUnlock;->mIsRunning:Z

    .line 359
    new-instance v0, Lcom/android/keyguard/FaceUnlock$1;

    invoke-direct {v0, p0}, Lcom/android/keyguard/FaceUnlock$1;-><init>(Lcom/android/keyguard/FaceUnlock;)V

    iput-object v0, p0, Lcom/android/keyguard/FaceUnlock;->mConnection:Landroid/content/ServiceConnection;

    .line 429
    new-instance v0, Lcom/android/keyguard/FaceUnlock$2;

    invoke-direct {v0, p0}, Lcom/android/keyguard/FaceUnlock$2;-><init>(Lcom/android/keyguard/FaceUnlock;)V

    iput-object v0, p0, Lcom/android/keyguard/FaceUnlock;->mFaceUnlockCallback:Lcom/android/internal/policy/IFaceLockCallback;

    .line 76
    iput-object p1, p0, Lcom/android/keyguard/FaceUnlock;->mContext:Landroid/content/Context;

    .line 77
    new-instance v0, Lcom/android/internal/widget/LockPatternUtils;

    invoke-direct {v0, p1}, Lcom/android/internal/widget/LockPatternUtils;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/android/keyguard/FaceUnlock;->mLockPatternUtils:Lcom/android/internal/widget/LockPatternUtils;

    .line 78
    new-instance v0, Landroid/os/Handler;

    invoke-direct {v0, p0}, Landroid/os/Handler;-><init>(Landroid/os/Handler$Callback;)V

    iput-object v0, p0, Lcom/android/keyguard/FaceUnlock;->mHandler:Landroid/os/Handler;

    .line 79
    return-void
.end method

.method static synthetic access$002(Lcom/android/keyguard/FaceUnlock;Lcom/android/internal/policy/IFaceLockInterface;)Lcom/android/internal/policy/IFaceLockInterface;
    .locals 0
    .param p0, "x0"    # Lcom/android/keyguard/FaceUnlock;
    .param p1, "x1"    # Lcom/android/internal/policy/IFaceLockInterface;

    .prologue
    .line 38
    iput-object p1, p0, Lcom/android/keyguard/FaceUnlock;->mService:Lcom/android/internal/policy/IFaceLockInterface;

    return-object p1
.end method

.method static synthetic access$100(Lcom/android/keyguard/FaceUnlock;)Landroid/os/Handler;
    .locals 1
    .param p0, "x0"    # Lcom/android/keyguard/FaceUnlock;

    .prologue
    .line 38
    iget-object v0, p0, Lcom/android/keyguard/FaceUnlock;->mHandler:Landroid/os/Handler;

    return-object v0
.end method

.method private startUi(Landroid/os/IBinder;IIII)V
    .locals 9
    .param p1, "windowToken"    # Landroid/os/IBinder;
    .param p2, "x"    # I
    .param p3, "y"    # I
    .param p4, "w"    # I
    .param p5, "h"    # I

    .prologue
    .line 383
    iget-object v8, p0, Lcom/android/keyguard/FaceUnlock;->mServiceRunningLock:Ljava/lang/Object;

    monitor-enter v8

    .line 384
    :try_start_0
    iget-boolean v0, p0, Lcom/android/keyguard/FaceUnlock;->mServiceRunning:Z

    if-nez v0, :cond_0

    .line 385
    const-string v0, "FULLockscreen"

    const-string v1, "Starting Face Unlock"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 387
    :try_start_1
    iget-object v0, p0, Lcom/android/keyguard/FaceUnlock;->mService:Lcom/android/internal/policy/IFaceLockInterface;

    iget-object v1, p0, Lcom/android/keyguard/FaceUnlock;->mLockPatternUtils:Lcom/android/internal/widget/LockPatternUtils;

    invoke-virtual {v1}, Lcom/android/internal/widget/LockPatternUtils;->isBiometricWeakLivelinessEnabled()Z

    move-result v6

    move-object v1, p1

    move v2, p2

    move v3, p3

    move v4, p4

    move v5, p5

    invoke-interface/range {v0 .. v6}, Lcom/android/internal/policy/IFaceLockInterface;->startUi(Landroid/os/IBinder;IIIIZ)V
    :try_end_1
    .catch Landroid/os/RemoteException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 393
    const/4 v0, 0x1

    :try_start_2
    iput-boolean v0, p0, Lcom/android/keyguard/FaceUnlock;->mServiceRunning:Z

    .line 397
    :goto_0
    monitor-exit v8

    .line 398
    :goto_1
    return-void

    .line 389
    :catch_0
    move-exception v7

    .line 390
    .local v7, "e":Landroid/os/RemoteException;
    const-string v0, "FULLockscreen"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Caught exception starting Face Unlock: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v7}, Landroid/os/RemoteException;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 391
    monitor-exit v8

    goto :goto_1

    .line 397
    .end local v7    # "e":Landroid/os/RemoteException;
    :catchall_0
    move-exception v0

    monitor-exit v8
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v0

    .line 395
    :cond_0
    :try_start_3
    const-string v0, "FULLockscreen"

    const-string v1, "startUi() attempted while running"

    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    goto :goto_0
.end method

.method private stopUi()V
    .locals 5

    .prologue
    .line 408
    iget-object v2, p0, Lcom/android/keyguard/FaceUnlock;->mServiceRunningLock:Ljava/lang/Object;

    monitor-enter v2

    .line 409
    :try_start_0
    iget-boolean v1, p0, Lcom/android/keyguard/FaceUnlock;->mServiceRunning:Z

    if-eqz v1, :cond_0

    .line 410
    const-string v1, "FULLockscreen"

    const-string v3, "Stopping Face Unlock"

    invoke-static {v1, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 412
    :try_start_1
    iget-object v1, p0, Lcom/android/keyguard/FaceUnlock;->mService:Lcom/android/internal/policy/IFaceLockInterface;

    invoke-interface {v1}, Lcom/android/internal/policy/IFaceLockInterface;->stopUi()V
    :try_end_1
    .catch Landroid/os/RemoteException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 416
    :goto_0
    const/4 v1, 0x0

    :try_start_2
    iput-boolean v1, p0, Lcom/android/keyguard/FaceUnlock;->mServiceRunning:Z

    .line 423
    :cond_0
    monitor-exit v2

    .line 424
    return-void

    .line 413
    :catch_0
    move-exception v0

    .line 414
    .local v0, "e":Landroid/os/RemoteException;
    const-string v1, "FULLockscreen"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Caught exception stopping Face Unlock: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v0}, Landroid/os/RemoteException;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v1, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 423
    .end local v0    # "e":Landroid/os/RemoteException;
    :catchall_0
    move-exception v1

    monitor-exit v2
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v1
.end method


# virtual methods
.method handleCancel()V
    .locals 2

    .prologue
    .line 326
    iget-object v0, p0, Lcom/android/keyguard/FaceUnlock;->mContext:Landroid/content/Context;

    invoke-static {v0}, Lcom/android/keyguard/KeyguardUpdateMonitor;->getInstance(Landroid/content/Context;)Lcom/android/keyguard/KeyguardUpdateMonitor;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/android/keyguard/KeyguardUpdateMonitor;->setAlternateUnlockEnabled(Z)V

    .line 328
    iget-object v0, p0, Lcom/android/keyguard/FaceUnlock;->mKeyguardScreenCallback:Lcom/android/keyguard/KeyguardSecurityCallback;

    invoke-interface {v0}, Lcom/android/keyguard/KeyguardSecurityCallback;->showBackupSecurity()V

    .line 329
    invoke-virtual {p0}, Lcom/android/keyguard/FaceUnlock;->stop()Z

    .line 330
    iget-object v0, p0, Lcom/android/keyguard/FaceUnlock;->mKeyguardScreenCallback:Lcom/android/keyguard/KeyguardSecurityCallback;

    invoke-interface {v0}, Lcom/android/keyguard/KeyguardSecurityCallback;->userActivity()V

    .line 331
    return-void
.end method

.method public handleMessage(Landroid/os/Message;)Z
    .locals 2
    .param p1, "msg"    # Landroid/os/Message;

    .prologue
    .line 214
    iget v0, p1, Landroid/os/Message;->what:I

    packed-switch v0, :pswitch_data_0

    .line 234
    const-string v0, "FULLockscreen"

    const-string v1, "Unhandled message"

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 235
    const/4 v0, 0x0

    .line 237
    :goto_0
    return v0

    .line 216
    :pswitch_0
    invoke-virtual {p0}, Lcom/android/keyguard/FaceUnlock;->handleServiceConnected()V

    .line 237
    :goto_1
    const/4 v0, 0x1

    goto :goto_0

    .line 219
    :pswitch_1
    invoke-virtual {p0}, Lcom/android/keyguard/FaceUnlock;->handleServiceDisconnected()V

    goto :goto_1

    .line 222
    :pswitch_2
    iget v0, p1, Landroid/os/Message;->arg1:I

    invoke-virtual {p0, v0}, Lcom/android/keyguard/FaceUnlock;->handleUnlock(I)V

    goto :goto_1

    .line 225
    :pswitch_3
    invoke-virtual {p0}, Lcom/android/keyguard/FaceUnlock;->handleCancel()V

    goto :goto_1

    .line 228
    :pswitch_4
    invoke-virtual {p0}, Lcom/android/keyguard/FaceUnlock;->handleReportFailedAttempt()V

    goto :goto_1

    .line 231
    :pswitch_5
    iget v0, p1, Landroid/os/Message;->arg1:I

    invoke-virtual {p0, v0}, Lcom/android/keyguard/FaceUnlock;->handlePokeWakelock(I)V

    goto :goto_1

    .line 214
    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
        :pswitch_4
        :pswitch_5
    .end packed-switch
.end method

.method handlePokeWakelock(I)V
    .locals 3
    .param p1, "millis"    # I

    .prologue
    .line 350
    iget-object v1, p0, Lcom/android/keyguard/FaceUnlock;->mContext:Landroid/content/Context;

    const-string v2, "power"

    invoke-virtual {v1, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/os/PowerManager;

    .line 351
    .local v0, "powerManager":Landroid/os/PowerManager;
    invoke-virtual {v0}, Landroid/os/PowerManager;->isScreenOn()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 352
    iget-object v1, p0, Lcom/android/keyguard/FaceUnlock;->mKeyguardScreenCallback:Lcom/android/keyguard/KeyguardSecurityCallback;

    invoke-interface {v1}, Lcom/android/keyguard/KeyguardSecurityCallback;->userActivity()V

    .line 354
    :cond_0
    return-void
.end method

.method handleReportFailedAttempt()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 340
    iget-object v0, p0, Lcom/android/keyguard/FaceUnlock;->mContext:Landroid/content/Context;

    invoke-static {v0}, Lcom/android/keyguard/KeyguardUpdateMonitor;->getInstance(Landroid/content/Context;)Lcom/android/keyguard/KeyguardUpdateMonitor;

    move-result-object v0

    invoke-virtual {v0, v1}, Lcom/android/keyguard/KeyguardUpdateMonitor;->setAlternateUnlockEnabled(Z)V

    .line 342
    iget-object v0, p0, Lcom/android/keyguard/FaceUnlock;->mKeyguardScreenCallback:Lcom/android/keyguard/KeyguardSecurityCallback;

    invoke-interface {v0, v1}, Lcom/android/keyguard/KeyguardSecurityCallback;->reportUnlockAttempt(Z)V

    .line 343
    return-void
.end method

.method handleServiceConnected()V
    .locals 8

    .prologue
    const/4 v4, 0x0

    .line 245
    const-string v0, "FULLockscreen"

    const-string v2, "handleServiceConnected()"

    invoke-static {v0, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 252
    iget-boolean v0, p0, Lcom/android/keyguard/FaceUnlock;->mBoundToService:Z

    if-nez v0, :cond_1

    .line 253
    const-string v0, "FULLockscreen"

    const-string v2, "Dropping startUi() in handleServiceConnected() because no longer bound"

    invoke-static {v0, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 284
    :cond_0
    :goto_0
    return-void

    .line 258
    :cond_1
    :try_start_0
    iget-object v0, p0, Lcom/android/keyguard/FaceUnlock;->mService:Lcom/android/internal/policy/IFaceLockInterface;

    iget-object v2, p0, Lcom/android/keyguard/FaceUnlock;->mFaceUnlockCallback:Lcom/android/internal/policy/IFaceLockCallback;

    invoke-interface {v0, v2}, Lcom/android/internal/policy/IFaceLockInterface;->registerCallback(Lcom/android/internal/policy/IFaceLockCallback;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 267
    iget-object v0, p0, Lcom/android/keyguard/FaceUnlock;->mFaceUnlockView:Landroid/view/View;

    if-eqz v0, :cond_0

    .line 268
    iget-object v0, p0, Lcom/android/keyguard/FaceUnlock;->mFaceUnlockView:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getWindowToken()Landroid/os/IBinder;

    move-result-object v1

    .line 269
    .local v1, "windowToken":Landroid/os/IBinder;
    if-eqz v1, :cond_2

    .line 273
    iget-object v0, p0, Lcom/android/keyguard/FaceUnlock;->mKeyguardScreenCallback:Lcom/android/keyguard/KeyguardSecurityCallback;

    invoke-interface {v0}, Lcom/android/keyguard/KeyguardSecurityCallback;->userActivity()V

    .line 276
    const/4 v0, 0x2

    new-array v7, v0, [I

    .line 277
    .local v7, "position":[I
    iget-object v0, p0, Lcom/android/keyguard/FaceUnlock;->mFaceUnlockView:Landroid/view/View;

    invoke-virtual {v0, v7}, Landroid/view/View;->getLocationInWindow([I)V

    .line 278
    aget v2, v7, v4

    const/4 v0, 0x1

    aget v3, v7, v0

    iget-object v0, p0, Lcom/android/keyguard/FaceUnlock;->mFaceUnlockView:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getWidth()I

    move-result v4

    iget-object v0, p0, Lcom/android/keyguard/FaceUnlock;->mFaceUnlockView:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getHeight()I

    move-result v5

    move-object v0, p0

    invoke-direct/range {v0 .. v5}, Lcom/android/keyguard/FaceUnlock;->startUi(Landroid/os/IBinder;IIII)V

    goto :goto_0

    .line 259
    .end local v1    # "windowToken":Landroid/os/IBinder;
    .end local v7    # "position":[I
    :catch_0
    move-exception v6

    .line 260
    .local v6, "e":Landroid/os/RemoteException;
    const-string v0, "FULLockscreen"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Caught exception connecting to Face Unlock: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v6}, Landroid/os/RemoteException;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 261
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/android/keyguard/FaceUnlock;->mService:Lcom/android/internal/policy/IFaceLockInterface;

    .line 262
    iput-boolean v4, p0, Lcom/android/keyguard/FaceUnlock;->mBoundToService:Z

    .line 263
    iput-boolean v4, p0, Lcom/android/keyguard/FaceUnlock;->mIsRunning:Z

    goto :goto_0

    .line 281
    .end local v6    # "e":Landroid/os/RemoteException;
    .restart local v1    # "windowToken":Landroid/os/IBinder;
    :cond_2
    const-string v0, "FULLockscreen"

    const-string v2, "windowToken is null in handleServiceConnected()"

    invoke-static {v0, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method handleServiceDisconnected()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 291
    const-string v0, "FULLockscreen"

    const-string v1, "handleServiceDisconnected()"

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 294
    iget-object v1, p0, Lcom/android/keyguard/FaceUnlock;->mServiceRunningLock:Ljava/lang/Object;

    monitor-enter v1

    .line 295
    const/4 v0, 0x0

    :try_start_0
    iput-object v0, p0, Lcom/android/keyguard/FaceUnlock;->mService:Lcom/android/internal/policy/IFaceLockInterface;

    .line 296
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/keyguard/FaceUnlock;->mServiceRunning:Z

    .line 297
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 298
    iput-boolean v2, p0, Lcom/android/keyguard/FaceUnlock;->mBoundToService:Z

    .line 299
    iput-boolean v2, p0, Lcom/android/keyguard/FaceUnlock;->mIsRunning:Z

    .line 300
    return-void

    .line 297
    :catchall_0
    move-exception v0

    :try_start_1
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0
.end method

.method handleUnlock(I)V
    .locals 4
    .param p1, "authenticatedUserId"    # I

    .prologue
    const/4 v2, 0x1

    .line 307
    invoke-virtual {p0}, Lcom/android/keyguard/FaceUnlock;->stop()Z

    .line 308
    iget-object v1, p0, Lcom/android/keyguard/FaceUnlock;->mLockPatternUtils:Lcom/android/internal/widget/LockPatternUtils;

    invoke-virtual {v1}, Lcom/android/internal/widget/LockPatternUtils;->getCurrentUser()I

    move-result v0

    .line 309
    .local v0, "currentUserId":I
    if-ne p1, v0, :cond_0

    .line 311
    iget-object v1, p0, Lcom/android/keyguard/FaceUnlock;->mKeyguardScreenCallback:Lcom/android/keyguard/KeyguardSecurityCallback;

    invoke-interface {v1, v2}, Lcom/android/keyguard/KeyguardSecurityCallback;->reportUnlockAttempt(Z)V

    .line 312
    iget-object v1, p0, Lcom/android/keyguard/FaceUnlock;->mKeyguardScreenCallback:Lcom/android/keyguard/KeyguardSecurityCallback;

    invoke-interface {v1, v2}, Lcom/android/keyguard/KeyguardSecurityCallback;->dismiss(Z)V

    .line 317
    :goto_0
    return-void

    .line 314
    :cond_0
    const-string v1, "FULLockscreen"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Ignoring unlock for authenticated user ("

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ") because the current user is "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method public initializeView(Landroid/view/View;)V
    .locals 2
    .param p1, "biometricUnlockView"    # Landroid/view/View;

    .prologue
    .line 91
    const-string v0, "FULLockscreen"

    const-string v1, "initializeView()"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 92
    iput-object p1, p0, Lcom/android/keyguard/FaceUnlock;->mFaceUnlockView:Landroid/view/View;

    .line 93
    return-void
.end method

.method public setKeyguardCallback(Lcom/android/keyguard/KeyguardSecurityCallback;)V
    .locals 0
    .param p1, "keyguardScreenCallback"    # Lcom/android/keyguard/KeyguardSecurityCallback;

    .prologue
    .line 82
    iput-object p1, p0, Lcom/android/keyguard/FaceUnlock;->mKeyguardScreenCallback:Lcom/android/keyguard/KeyguardSecurityCallback;

    .line 83
    return-void
.end method

.method public start()Z
    .locals 6

    .prologue
    const/4 v5, 0x1

    .line 117
    iget-object v0, p0, Lcom/android/keyguard/FaceUnlock;->mHandler:Landroid/os/Handler;

    invoke-virtual {v0}, Landroid/os/Handler;->getLooper()Landroid/os/Looper;

    move-result-object v0

    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    move-result-object v1

    if-eq v0, v1, :cond_0

    .line 118
    const-string v0, "FULLockscreen"

    const-string v1, "start() called off of the UI thread"

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 121
    :cond_0
    iget-boolean v0, p0, Lcom/android/keyguard/FaceUnlock;->mIsRunning:Z

    if-eqz v0, :cond_1

    .line 122
    const-string v0, "FULLockscreen"

    const-string v1, "start() called when already running"

    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 125
    :cond_1
    iget-boolean v0, p0, Lcom/android/keyguard/FaceUnlock;->mBoundToService:Z

    if-nez v0, :cond_2

    .line 126
    const-string v0, "FULLockscreen"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Binding to Face Unlock service for user="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/android/keyguard/FaceUnlock;->mLockPatternUtils:Lcom/android/internal/widget/LockPatternUtils;

    invoke-virtual {v2}, Lcom/android/internal/widget/LockPatternUtils;->getCurrentUser()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 128
    iget-object v0, p0, Lcom/android/keyguard/FaceUnlock;->mContext:Landroid/content/Context;

    new-instance v1, Landroid/content/Intent;

    const-class v2, Lcom/android/internal/policy/IFaceLockInterface;

    invoke-virtual {v2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const-string v2, "com.android.facelock"

    invoke-virtual {v1, v2}, Landroid/content/Intent;->setPackage(Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v1

    iget-object v2, p0, Lcom/android/keyguard/FaceUnlock;->mConnection:Landroid/content/ServiceConnection;

    new-instance v3, Landroid/os/UserHandle;

    iget-object v4, p0, Lcom/android/keyguard/FaceUnlock;->mLockPatternUtils:Lcom/android/internal/widget/LockPatternUtils;

    invoke-virtual {v4}, Lcom/android/internal/widget/LockPatternUtils;->getCurrentUser()I

    move-result v4

    invoke-direct {v3, v4}, Landroid/os/UserHandle;-><init>(I)V

    invoke-virtual {v0, v1, v2, v5, v3}, Landroid/content/Context;->bindServiceAsUser(Landroid/content/Intent;Landroid/content/ServiceConnection;ILandroid/os/UserHandle;)Z

    .line 133
    iput-boolean v5, p0, Lcom/android/keyguard/FaceUnlock;->mBoundToService:Z

    .line 138
    :goto_0
    iput-boolean v5, p0, Lcom/android/keyguard/FaceUnlock;->mIsRunning:Z

    .line 139
    return v5

    .line 135
    :cond_2
    const-string v0, "FULLockscreen"

    const-string v1, "Attempt to bind to Face Unlock when already bound"

    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method public stop()Z
    .locals 6

    .prologue
    const/4 v5, 0x0

    .line 147
    iget-object v2, p0, Lcom/android/keyguard/FaceUnlock;->mHandler:Landroid/os/Handler;

    invoke-virtual {v2}, Landroid/os/Handler;->getLooper()Landroid/os/Looper;

    move-result-object v2

    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    move-result-object v3

    if-eq v2, v3, :cond_0

    .line 148
    const-string v2, "FULLockscreen"

    const-string v3, "stop() called from non-UI thread"

    invoke-static {v2, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 152
    :cond_0
    iget-object v2, p0, Lcom/android/keyguard/FaceUnlock;->mHandler:Landroid/os/Handler;

    invoke-virtual {v2, v5}, Landroid/os/Handler;->removeMessages(I)V

    .line 154
    iget-boolean v1, p0, Lcom/android/keyguard/FaceUnlock;->mIsRunning:Z

    .line 156
    .local v1, "mWasRunning":Z
    invoke-direct {p0}, Lcom/android/keyguard/FaceUnlock;->stopUi()V

    .line 158
    iget-boolean v2, p0, Lcom/android/keyguard/FaceUnlock;->mBoundToService:Z

    if-eqz v2, :cond_2

    .line 159
    iget-object v2, p0, Lcom/android/keyguard/FaceUnlock;->mService:Lcom/android/internal/policy/IFaceLockInterface;

    if-eqz v2, :cond_1

    .line 161
    :try_start_0
    iget-object v2, p0, Lcom/android/keyguard/FaceUnlock;->mService:Lcom/android/internal/policy/IFaceLockInterface;

    iget-object v3, p0, Lcom/android/keyguard/FaceUnlock;->mFaceUnlockCallback:Lcom/android/internal/policy/IFaceLockCallback;

    invoke-interface {v2, v3}, Lcom/android/internal/policy/IFaceLockInterface;->unregisterCallback(Lcom/android/internal/policy/IFaceLockCallback;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_1

    .line 166
    :cond_1
    :goto_0
    const-string v2, "FULLockscreen"

    const-string v3, "Unbinding from Face Unlock service"

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 169
    :try_start_1
    iget-object v2, p0, Lcom/android/keyguard/FaceUnlock;->mContext:Landroid/content/Context;

    iget-object v3, p0, Lcom/android/keyguard/FaceUnlock;->mConnection:Landroid/content/ServiceConnection;

    invoke-virtual {v2, v3}, Landroid/content/Context;->unbindService(Landroid/content/ServiceConnection;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 174
    :goto_1
    iput-boolean v5, p0, Lcom/android/keyguard/FaceUnlock;->mBoundToService:Z

    .line 181
    :cond_2
    iput-boolean v5, p0, Lcom/android/keyguard/FaceUnlock;->mIsRunning:Z

    .line 182
    return v1

    .line 170
    :catch_0
    move-exception v0

    .line 171
    .local v0, "e":Ljava/lang/Exception;
    const-string v2, "FULLockscreen"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Exception when mContext.unbindService = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_1

    .line 162
    .end local v0    # "e":Ljava/lang/Exception;
    :catch_1
    move-exception v2

    goto :goto_0
.end method

.method public stopAndShowBackup()V
    .locals 2

    .prologue
    .line 107
    iget-object v0, p0, Lcom/android/keyguard/FaceUnlock;->mHandler:Landroid/os/Handler;

    const/4 v1, 0x3

    invoke-virtual {v0, v1}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    .line 108
    return-void
.end method
