.class Lcom/flyersoft/moonreaderp/PrefShelf$1;
.super Ljava/lang/Object;
.source "PrefShelf.java"

# interfaces
.implements Landroid/widget/CompoundButton$OnCheckedChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/PrefShelf;->initView()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/moonreaderp/PrefShelf;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/PrefShelf;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 134
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefShelf$1;->this$0:Lcom/flyersoft/moonreaderp/PrefShelf;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onCheckedChanged(Landroid/widget/CompoundButton;Z)V
    .locals 1

    if-eqz p2, :cond_0

    .line 137
    iget-object p2, p0, Lcom/flyersoft/moonreaderp/PrefShelf$1;->this$0:Lcom/flyersoft/moonreaderp/PrefShelf;

    invoke-virtual {p2}, Lcom/flyersoft/moonreaderp/PrefShelf;->getContext()Landroid/content/Context;

    move-result-object p2

    invoke-static {p2}, Lcom/hailong/biometricprompt/fingerprint/FingerprintVerifyManager;->hasEnrolled(Landroid/content/Context;)Z

    move-result p2

    if-nez p2, :cond_0

    const/4 p2, 0x0

    .line 138
    invoke-virtual {p1, p2}, Landroid/widget/CompoundButton;->setChecked(Z)V

    .line 139
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefShelf$1;->this$0:Lcom/flyersoft/moonreaderp/PrefShelf;

    invoke-virtual {p1}, Lcom/flyersoft/moonreaderp/PrefShelf;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-static {p1}, Lcom/hailong/biometricprompt/fingerprint/FingerprintVerifyManager;->showEnrollDialog(Landroid/content/Context;)Z

    move-result p1

    if-nez p1, :cond_0

    .line 140
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefShelf$1;->this$0:Lcom/flyersoft/moonreaderp/PrefShelf;

    invoke-virtual {p1}, Lcom/flyersoft/moonreaderp/PrefShelf;->getContext()Landroid/content/Context;

    move-result-object p1

    iget-object p2, p0, Lcom/flyersoft/moonreaderp/PrefShelf$1;->this$0:Lcom/flyersoft/moonreaderp/PrefShelf;

    invoke-virtual {p2}, Lcom/flyersoft/moonreaderp/PrefShelf;->getContext()Landroid/content/Context;

    move-result-object p2

    sget v0, Lcom/flyersoft/moonreaderp/R$string;->biometricprompt_finger_add:I

    invoke-virtual {p2, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p2

    invoke-static {p1, p2}, Lcom/flyersoft/tools/T;->showAlertText(Landroid/content/Context;Ljava/lang/CharSequence;)V

    :cond_0
    return-void
.end method
