.class Lcom/android/settings/TrustedCredentialsSettings$2;
.super Ljava/lang/Object;
.source "TrustedCredentialsSettings.java"

# interfaces
.implements Landroid/widget/AdapterView$OnItemClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/settings/TrustedCredentialsSettings;->addTab(Lcom/android/settings/TrustedCredentialsSettings$Tab;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/settings/TrustedCredentialsSettings;

.field final synthetic val$adapter:Lcom/android/settings/TrustedCredentialsSettings$TrustedCertificateAdapter;


# direct methods
.method constructor <init>(Lcom/android/settings/TrustedCredentialsSettings;Lcom/android/settings/TrustedCredentialsSettings$TrustedCertificateAdapter;)V
    .locals 0

    iput-object p1, p0, Lcom/android/settings/TrustedCredentialsSettings$2;->this$0:Lcom/android/settings/TrustedCredentialsSettings;

    iput-object p2, p0, Lcom/android/settings/TrustedCredentialsSettings$2;->val$adapter:Lcom/android/settings/TrustedCredentialsSettings$TrustedCertificateAdapter;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onItemClick(Landroid/widget/AdapterView;Landroid/view/View;IJ)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/widget/AdapterView",
            "<*>;",
            "Landroid/view/View;",
            "IJ)V"
        }
    .end annotation

    iget-object v0, p0, Lcom/android/settings/TrustedCredentialsSettings$2;->this$0:Lcom/android/settings/TrustedCredentialsSettings;

    iget-object v1, p0, Lcom/android/settings/TrustedCredentialsSettings$2;->val$adapter:Lcom/android/settings/TrustedCredentialsSettings$TrustedCertificateAdapter;

    invoke-virtual {v1, p3}, Lcom/android/settings/TrustedCredentialsSettings$TrustedCertificateAdapter;->getItem(I)Lcom/android/settings/TrustedCredentialsSettings$CertHolder;

    move-result-object v1

    # invokes: Lcom/android/settings/TrustedCredentialsSettings;->showCertDialog(Lcom/android/settings/TrustedCredentialsSettings$CertHolder;)V
    invoke-static {v0, v1}, Lcom/android/settings/TrustedCredentialsSettings;->access$800(Lcom/android/settings/TrustedCredentialsSettings;Lcom/android/settings/TrustedCredentialsSettings$CertHolder;)V

    return-void
.end method
