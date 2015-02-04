.class public Lcom/android/internal/policy/impl/ActionUtils;
.super Ljava/lang/Object;
.source "ActionUtils.java"


# static fields
.field private static final DEBUG:Z = false

.field private static final SYSTEMUI_PACKAGE:Ljava/lang/String; = "com.android.systemui"

.field private static final TAG:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const-class v0, Lcom/android/internal/policy/impl/ActionUtils;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/android/internal/policy/impl/ActionUtils;->TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static getLastTask(Landroid/content/Context;I)Landroid/app/ActivityManager$RecentTaskInfo;
    .locals 8
    .param p0    # Landroid/content/Context;
    .param p1    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    invoke-static {p0, p1}, Lcom/android/internal/policy/impl/ActionUtils;->resolveCurrentLauncherPackage(Landroid/content/Context;I)Ljava/lang/String;

    move-result-object v1

    invoke-static {}, Landroid/app/ActivityManagerNative;->getDefault()Landroid/app/IActivityManager;

    move-result-object v0

    const/4 v6, 0x5

    const/4 v7, 0x2

    invoke-interface {v0, v6, v7, p1}, Landroid/app/IActivityManager;->getRecentTasks(III)Ljava/util/List;

    move-result-object v5

    const/4 v2, 0x1

    :goto_0
    invoke-interface {v5}, Ljava/util/List;->size()I

    move-result v6

    if-ge v2, v6, :cond_2

    invoke-interface {v5, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/app/ActivityManager$RecentTaskInfo;

    iget-object v6, v4, Landroid/app/ActivityManager$RecentTaskInfo;->origActivity:Landroid/content/ComponentName;

    if-eqz v6, :cond_0

    iget-object v6, v4, Landroid/app/ActivityManager$RecentTaskInfo;->baseIntent:Landroid/content/Intent;

    iget-object v7, v4, Landroid/app/ActivityManager$RecentTaskInfo;->origActivity:Landroid/content/ComponentName;

    invoke-virtual {v6, v7}, Landroid/content/Intent;->setComponent(Landroid/content/ComponentName;)Landroid/content/Intent;

    :cond_0
    iget-object v6, v4, Landroid/app/ActivityManager$RecentTaskInfo;->baseIntent:Landroid/content/Intent;

    invoke-virtual {v6}, Landroid/content/Intent;->getComponent()Landroid/content/ComponentName;

    move-result-object v6

    invoke-virtual {v6}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_1

    const-string v6, "com.android.systemui"

    invoke-virtual {v3, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_1

    invoke-interface {v5, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Landroid/app/ActivityManager$RecentTaskInfo;

    :goto_1
    return-object v6

    :cond_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_2
    const/4 v6, 0x0

    goto :goto_1
.end method

.method public static killForegroundApp(Landroid/content/Context;I)Z
    .locals 3
    .param p0    # Landroid/content/Context;
    .param p1    # I

    :try_start_0
    invoke-static {p0, p1}, Lcom/android/internal/policy/impl/ActionUtils;->killForegroundAppInternal(Landroid/content/Context;I)Z
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v1

    :goto_0
    return v1

    :catch_0
    move-exception v0

    sget-object v1, Lcom/android/internal/policy/impl/ActionUtils;->TAG:Ljava/lang/String;

    const-string v2, "Could not kill foreground app"

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    const/4 v1, 0x0

    goto :goto_0
.end method

.method private static killForegroundAppInternal(Landroid/content/Context;I)Z
    .locals 14
    .param p0    # Landroid/content/Context;
    .param p1    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    :try_start_0
    new-instance v7, Landroid/content/Intent;

    const-string v12, "android.intent.action.MAIN"

    invoke-direct {v7, v12}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const-string v4, "com.android.launcher"

    const-string v12, "android.intent.category.HOME"

    invoke-virtual {v7, v12}, Landroid/content/Intent;->addCategory(Ljava/lang/String;)Landroid/content/Intent;

    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v12

    const/4 v13, 0x0

    invoke-virtual {v12, v7, v13}, Landroid/content/pm/PackageManager;->resolveActivity(Landroid/content/Intent;I)Landroid/content/pm/ResolveInfo;

    move-result-object v10

    iget-object v12, v10, Landroid/content/pm/ResolveInfo;->activityInfo:Landroid/content/pm/ActivityInfo;

    if-eqz v12, :cond_0

    iget-object v12, v10, Landroid/content/pm/ResolveInfo;->activityInfo:Landroid/content/pm/ActivityInfo;

    iget-object v12, v12, Landroid/content/pm/ActivityInfo;->packageName:Ljava/lang/String;

    const-string v13, "android"

    invoke-virtual {v12, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-nez v12, :cond_0

    iget-object v12, v10, Landroid/content/pm/ResolveInfo;->activityInfo:Landroid/content/pm/ActivityInfo;

    iget-object v4, v12, Landroid/content/pm/ActivityInfo;->packageName:Ljava/lang/String;

    :cond_0
    invoke-static {}, Landroid/app/ActivityManagerNative;->getDefault()Landroid/app/IActivityManager;

    move-result-object v0

    invoke-interface {v0}, Landroid/app/IActivityManager;->getRunningAppProcesses()Ljava/util/List;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :cond_1
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v12

    if-eqz v12, :cond_4

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/app/ActivityManager$RunningAppProcessInfo;

    iget v11, v1, Landroid/app/ActivityManager$RunningAppProcessInfo;->uid:I

    const/16 v12, 0x2710

    if-lt v11, v12, :cond_1

    const/16 v12, 0x4e1f

    if-gt v11, v12, :cond_1

    iget v12, v1, Landroid/app/ActivityManager$RunningAppProcessInfo;->importance:I

    const/16 v13, 0x64

    if-ne v12, v13, :cond_1

    iget-object v12, v1, Landroid/app/ActivityManager$RunningAppProcessInfo;->pkgList:[Ljava/lang/String;

    if-eqz v12, :cond_3

    iget-object v12, v1, Landroid/app/ActivityManager$RunningAppProcessInfo;->pkgList:[Ljava/lang/String;

    array-length v12, v12

    if-lez v12, :cond_3

    iget-object v3, v1, Landroid/app/ActivityManager$RunningAppProcessInfo;->pkgList:[Ljava/lang/String;

    array-length v8, v3

    const/4 v6, 0x0

    :goto_0
    if-ge v6, v8, :cond_1

    aget-object v9, v3, v6

    const-string v12, "com.android.systemui"

    invoke-virtual {v9, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-nez v12, :cond_2

    invoke-virtual {v9, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-nez v12, :cond_2

    const/4 v12, -0x2

    invoke-interface {v0, v9, v12}, Landroid/app/IActivityManager;->forceStopPackage(Ljava/lang/String;I)V

    const/4 v12, 0x1

    :goto_1
    return v12

    :cond_2
    add-int/lit8 v6, v6, 0x1

    goto :goto_0

    :cond_3
    iget v12, v1, Landroid/app/ActivityManager$RunningAppProcessInfo;->pid:I

    invoke-static {v12}, Landroid/os/Process;->killProcess(I)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    const/4 v12, 0x1

    goto :goto_1

    :catch_0
    move-exception v12

    :cond_4
    const/4 v12, 0x0

    goto :goto_1
.end method

.method private static resolveCurrentLauncherPackage(Landroid/content/Context;I)Ljava/lang/String;
    .locals 5
    .param p0    # Landroid/content/Context;
    .param p1    # I

    new-instance v3, Landroid/content/Intent;

    const-string v4, "android.intent.action.MAIN"

    invoke-direct {v3, v4}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const-string v4, "android.intent.category.HOME"

    invoke-virtual {v3, v4}, Landroid/content/Intent;->addCategory(Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v1

    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v2

    const/4 v3, 0x0

    invoke-virtual {v2, v1, v3, p1}, Landroid/content/pm/PackageManager;->resolveActivityAsUser(Landroid/content/Intent;II)Landroid/content/pm/ResolveInfo;

    move-result-object v0

    iget-object v3, v0, Landroid/content/pm/ResolveInfo;->activityInfo:Landroid/content/pm/ActivityInfo;

    iget-object v3, v3, Landroid/content/pm/ActivityInfo;->packageName:Ljava/lang/String;

    return-object v3
.end method

.method public static switchToLastApp(Landroid/content/Context;I)Z
    .locals 3
    .param p0    # Landroid/content/Context;
    .param p1    # I

    :try_start_0
    invoke-static {p0, p1}, Lcom/android/internal/policy/impl/ActionUtils;->switchToLastAppInternal(Landroid/content/Context;I)Z
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v1

    :goto_0
    return v1

    :catch_0
    move-exception v0

    sget-object v1, Lcom/android/internal/policy/impl/ActionUtils;->TAG:Ljava/lang/String;

    const-string v2, "Could not switch to last app"

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    const/4 v1, 0x0

    goto :goto_0
.end method

.method private static switchToLastAppInternal(Landroid/content/Context;I)Z
    .locals 7
    .param p0    # Landroid/content/Context;
    .param p1    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    invoke-static {p0, p1}, Lcom/android/internal/policy/impl/ActionUtils;->getLastTask(Landroid/content/Context;I)Landroid/app/ActivityManager$RecentTaskInfo;

    move-result-object v1

    if-eqz v1, :cond_0

    iget v4, v1, Landroid/app/ActivityManager$RecentTaskInfo;->id:I

    if-gez v4, :cond_1

    :cond_0
    const/4 v4, 0x0

    :goto_0
    return v4

    :cond_1
    iget-object v4, v1, Landroid/app/ActivityManager$RecentTaskInfo;->baseIntent:Landroid/content/Intent;

    invoke-virtual {v4}, Landroid/content/Intent;->getComponent()Landroid/content/ComponentName;

    move-result-object v4

    invoke-virtual {v4}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    move-result-object v3

    invoke-static {}, Landroid/app/ActivityManagerNative;->getDefault()Landroid/app/IActivityManager;

    move-result-object v0

    const v4, 0x10a0029

    const v5, 0x10a002a

    invoke-static {p0, v4, v5}, Landroid/app/ActivityOptions;->makeCustomAnimation(Landroid/content/Context;II)Landroid/app/ActivityOptions;

    move-result-object v2

    iget v4, v1, Landroid/app/ActivityManager$RecentTaskInfo;->id:I

    const/4 v5, 0x2

    invoke-virtual {v2}, Landroid/app/ActivityOptions;->toBundle()Landroid/os/Bundle;

    move-result-object v6

    invoke-interface {v0, v4, v5, v6}, Landroid/app/IActivityManager;->moveTaskToFront(IILandroid/os/Bundle;)V

    const/4 v4, 0x1

    goto :goto_0
.end method
