.class Lcom/android/settings/notification/HtcBoomSoundPreferenceBase$8;
.super Ljava/lang/Object;
.source "HtcBoomSoundPreferenceBase.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/settings/notification/HtcBoomSoundPreferenceBase;->setWidgetEnabled(Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/settings/notification/HtcBoomSoundPreferenceBase;

.field final synthetic val$enabled:Z


# direct methods
.method constructor <init>(Lcom/android/settings/notification/HtcBoomSoundPreferenceBase;Z)V
    .locals 0

    iput-object p1, p0, Lcom/android/settings/notification/HtcBoomSoundPreferenceBase$8;->this$0:Lcom/android/settings/notification/HtcBoomSoundPreferenceBase;

    iput-boolean p2, p0, Lcom/android/settings/notification/HtcBoomSoundPreferenceBase$8;->val$enabled:Z

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    iget-object v0, p0, Lcom/android/settings/notification/HtcBoomSoundPreferenceBase$8;->this$0:Lcom/android/settings/notification/HtcBoomSoundPreferenceBase;

    iget-boolean v1, p0, Lcom/android/settings/notification/HtcBoomSoundPreferenceBase$8;->val$enabled:Z

    invoke-virtual {v0, v1}, Lcom/android/settings/notification/HtcBoomSoundPreferenceBase;->setEnabled(Z)V

    return-void
.end method