.class synthetic Lcom/android/systemui/statusbar/phone/KeyguardBottomAreaView$5;
.super Ljava/lang/Object;
.source "KeyguardBottomAreaView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/systemui/statusbar/phone/KeyguardBottomAreaView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1008
    name = null
.end annotation


# static fields
.field static final synthetic $SwitchMap$com$android$internal$util$cm$LockscreenShortcutsHelper$Shortcuts:[I


# direct methods
.method static constructor <clinit>()V
    .locals 3

    invoke-static {}, Lcom/android/internal/policy/impl/LockscreenShortcutsHelper$Shortcuts;->values()[Lcom/android/internal/policy/impl/LockscreenShortcutsHelper$Shortcuts;

    move-result-object v0

    array-length v0, v0

    new-array v0, v0, [I

    sput-object v0, Lcom/android/systemui/statusbar/phone/KeyguardBottomAreaView$5;->$SwitchMap$com$android$internal$util$cm$LockscreenShortcutsHelper$Shortcuts:[I

    :try_start_0
    sget-object v0, Lcom/android/systemui/statusbar/phone/KeyguardBottomAreaView$5;->$SwitchMap$com$android$internal$util$cm$LockscreenShortcutsHelper$Shortcuts:[I

    sget-object v1, Lcom/android/internal/policy/impl/LockscreenShortcutsHelper$Shortcuts;->LEFT_SHORTCUT:Lcom/android/internal/policy/impl/LockscreenShortcutsHelper$Shortcuts;

    invoke-virtual {v1}, Lcom/android/internal/policy/impl/LockscreenShortcutsHelper$Shortcuts;->ordinal()I

    move-result v1

    const/4 v2, 0x1

    aput v2, v0, v1
    :try_end_0
    .catch Ljava/lang/NoSuchFieldError; {:try_start_0 .. :try_end_0} :catch_1

    :goto_0
    :try_start_1
    sget-object v0, Lcom/android/systemui/statusbar/phone/KeyguardBottomAreaView$5;->$SwitchMap$com$android$internal$util$cm$LockscreenShortcutsHelper$Shortcuts:[I

    sget-object v1, Lcom/android/internal/policy/impl/LockscreenShortcutsHelper$Shortcuts;->RIGHT_SHORTCUT:Lcom/android/internal/policy/impl/LockscreenShortcutsHelper$Shortcuts;

    invoke-virtual {v1}, Lcom/android/internal/policy/impl/LockscreenShortcutsHelper$Shortcuts;->ordinal()I

    move-result v1

    const/4 v2, 0x2

    aput v2, v0, v1
    :try_end_1
    .catch Ljava/lang/NoSuchFieldError; {:try_start_1 .. :try_end_1} :catch_0

    :goto_1
    return-void

    :catch_0
    move-exception v0

    goto :goto_1

    :catch_1
    move-exception v0

    goto :goto_0
.end method
