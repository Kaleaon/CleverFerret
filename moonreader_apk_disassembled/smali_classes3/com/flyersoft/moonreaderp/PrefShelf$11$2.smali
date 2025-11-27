.class Lcom/flyersoft/moonreaderp/PrefShelf$11$2;
.super Ljava/lang/Object;
.source "PrefShelf.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/PrefShelf$11;->onCheckedChanged(Landroid/widget/CompoundButton;Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/flyersoft/moonreaderp/PrefShelf$11;

.field final synthetic val$c:Lcom/google/android/material/materialswitch/MaterialSwitch;

.field final synthetic val$pass1Et:Landroid/widget/EditText;

.field final synthetic val$pass2Et:Landroid/widget/EditText;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/PrefShelf$11;Landroid/widget/EditText;Landroid/widget/EditText;Lcom/google/android/material/materialswitch/MaterialSwitch;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010,
            0x1010,
            0x1010,
            0x1010
        }
        names = {
            null,
            null,
            null,
            null
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 413
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefShelf$11$2;->this$1:Lcom/flyersoft/moonreaderp/PrefShelf$11;

    iput-object p2, p0, Lcom/flyersoft/moonreaderp/PrefShelf$11$2;->val$pass1Et:Landroid/widget/EditText;

    iput-object p3, p0, Lcom/flyersoft/moonreaderp/PrefShelf$11$2;->val$pass2Et:Landroid/widget/EditText;

    iput-object p4, p0, Lcom/flyersoft/moonreaderp/PrefShelf$11$2;->val$c:Lcom/google/android/material/materialswitch/MaterialSwitch;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 3

    .line 415
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefShelf$11$2;->val$pass1Et:Landroid/widget/EditText;

    invoke-virtual {p1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    .line 416
    iget-object p2, p0, Lcom/flyersoft/moonreaderp/PrefShelf$11$2;->val$pass2Et:Landroid/widget/EditText;

    invoke-virtual {p2}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p2

    .line 417
    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    const/16 v0, 0x8

    const/4 v1, 0x0

    if-eqz p2, :cond_3

    .line 418
    const-string p2, ""

    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-nez p2, :cond_2

    .line 419
    sput-object p1, Lcom/flyersoft/tools/A;->startPassword:Ljava/lang/String;

    const/4 p1, 0x1

    .line 420
    sput-boolean p1, Lcom/flyersoft/tools/A;->needPasswordProtect:Z

    .line 422
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefShelf$11$2;->this$1:Lcom/flyersoft/moonreaderp/PrefShelf$11;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/PrefShelf$11;->this$0:Lcom/flyersoft/moonreaderp/PrefShelf;

    invoke-virtual {p1}, Lcom/flyersoft/moonreaderp/PrefShelf;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-static {p1}, Lcom/hailong/biometricprompt/fingerprint/FingerprintVerifyManager;->available(Landroid/content/Context;)Z

    move-result p1

    if-eqz p1, :cond_1

    .line 423
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefShelf$11$2;->this$1:Lcom/flyersoft/moonreaderp/PrefShelf$11;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/PrefShelf$11;->this$0:Lcom/flyersoft/moonreaderp/PrefShelf;

    invoke-static {p1, v1}, Lcom/flyersoft/moonreaderp/PrefShelf;->-$$Nest$mfingerCheckSetVisible(Lcom/flyersoft/moonreaderp/PrefShelf;I)V

    .line 424
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefShelf$11$2;->this$1:Lcom/flyersoft/moonreaderp/PrefShelf$11;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/PrefShelf$11;->this$0:Lcom/flyersoft/moonreaderp/PrefShelf;

    invoke-virtual {p1}, Lcom/flyersoft/moonreaderp/PrefShelf;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-static {p1}, Lcom/hailong/biometricprompt/fingerprint/FingerprintVerifyManager;->hasEnrolled(Landroid/content/Context;)Z

    move-result p1

    if-eqz p1, :cond_0

    .line 425
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefShelf$11$2;->this$1:Lcom/flyersoft/moonreaderp/PrefShelf$11;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/PrefShelf$11;->this$0:Lcom/flyersoft/moonreaderp/PrefShelf;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/PrefShelf;->fingerCheck:Lcom/google/android/material/materialswitch/MaterialSwitch;

    sget-boolean p2, Lcom/flyersoft/tools/A;->fingerPrint:Z

    invoke-virtual {p1, p2}, Lcom/google/android/material/materialswitch/MaterialSwitch;->setChecked(Z)V

    goto :goto_0

    .line 427
    :cond_0
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefShelf$11$2;->this$1:Lcom/flyersoft/moonreaderp/PrefShelf$11;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/PrefShelf$11;->this$0:Lcom/flyersoft/moonreaderp/PrefShelf;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/PrefShelf;->fingerCheck:Lcom/google/android/material/materialswitch/MaterialSwitch;

    invoke-virtual {p1, v1}, Lcom/google/android/material/materialswitch/MaterialSwitch;->setChecked(Z)V

    goto :goto_0

    .line 429
    :cond_1
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefShelf$11$2;->this$1:Lcom/flyersoft/moonreaderp/PrefShelf$11;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/PrefShelf$11;->this$0:Lcom/flyersoft/moonreaderp/PrefShelf;

    invoke-static {p1, v0}, Lcom/flyersoft/moonreaderp/PrefShelf;->-$$Nest$mfingerCheckSetVisible(Lcom/flyersoft/moonreaderp/PrefShelf;I)V

    .line 432
    :goto_0
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefShelf$11$2;->this$1:Lcom/flyersoft/moonreaderp/PrefShelf$11;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/PrefShelf$11;->this$0:Lcom/flyersoft/moonreaderp/PrefShelf;

    invoke-virtual {p1}, Lcom/flyersoft/moonreaderp/PrefShelf;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-static {p1}, Lcom/flyersoft/tools/A;->SaveOptions(Landroid/content/Context;)V

    .line 433
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefShelf$11$2;->this$1:Lcom/flyersoft/moonreaderp/PrefShelf$11;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/PrefShelf$11;->this$0:Lcom/flyersoft/moonreaderp/PrefShelf;

    invoke-virtual {p1}, Lcom/flyersoft/moonreaderp/PrefShelf;->getContext()Landroid/content/Context;

    move-result-object p1

    iget-object p2, p0, Lcom/flyersoft/moonreaderp/PrefShelf$11$2;->this$1:Lcom/flyersoft/moonreaderp/PrefShelf$11;

    iget-object p2, p2, Lcom/flyersoft/moonreaderp/PrefShelf$11;->this$0:Lcom/flyersoft/moonreaderp/PrefShelf;

    invoke-virtual {p2}, Lcom/flyersoft/moonreaderp/PrefShelf;->getContext()Landroid/content/Context;

    move-result-object p2

    sget v0, Lcom/flyersoft/moonreaderp/R$string;->password_ok:I

    invoke-virtual {p2, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p2

    invoke-static {p1, p2}, Lcom/flyersoft/tools/T;->showAlertText(Landroid/content/Context;Ljava/lang/CharSequence;)V

    return-void

    .line 435
    :cond_2
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefShelf$11$2;->val$c:Lcom/google/android/material/materialswitch/MaterialSwitch;

    invoke-virtual {p1, v1}, Lcom/google/android/material/materialswitch/MaterialSwitch;->setChecked(Z)V

    return-void

    .line 437
    :cond_3
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefShelf$11$2;->this$1:Lcom/flyersoft/moonreaderp/PrefShelf$11;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/PrefShelf$11;->this$0:Lcom/flyersoft/moonreaderp/PrefShelf;

    invoke-virtual {p1}, Lcom/flyersoft/moonreaderp/PrefShelf;->getContext()Landroid/content/Context;

    move-result-object p1

    iget-object p2, p0, Lcom/flyersoft/moonreaderp/PrefShelf$11$2;->this$1:Lcom/flyersoft/moonreaderp/PrefShelf$11;

    iget-object p2, p2, Lcom/flyersoft/moonreaderp/PrefShelf$11;->this$0:Lcom/flyersoft/moonreaderp/PrefShelf;

    invoke-virtual {p2}, Lcom/flyersoft/moonreaderp/PrefShelf;->getContext()Landroid/content/Context;

    move-result-object p2

    sget v2, Lcom/flyersoft/moonreaderp/R$string;->password_notpair:I

    invoke-virtual {p2, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p2

    invoke-static {p1, p2}, Lcom/flyersoft/tools/T;->showAlertText(Landroid/content/Context;Ljava/lang/CharSequence;)V

    .line 438
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefShelf$11$2;->val$c:Lcom/google/android/material/materialswitch/MaterialSwitch;

    invoke-virtual {p1, v1}, Lcom/google/android/material/materialswitch/MaterialSwitch;->setChecked(Z)V

    .line 439
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefShelf$11$2;->this$1:Lcom/flyersoft/moonreaderp/PrefShelf$11;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/PrefShelf$11;->this$0:Lcom/flyersoft/moonreaderp/PrefShelf;

    invoke-static {p1, v0}, Lcom/flyersoft/moonreaderp/PrefShelf;->-$$Nest$mfingerCheckSetVisible(Lcom/flyersoft/moonreaderp/PrefShelf;I)V

    return-void
.end method
