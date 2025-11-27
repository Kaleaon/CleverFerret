.class Lcom/flyersoft/components/Readwise$4;
.super Ljava/lang/Object;
.source "Readwise.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/components/Readwise;->showOption(Landroid/content/Context;Landroid/widget/CheckBox;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic val$context:Landroid/content/Context;

.field final synthetic val$et:Landroid/widget/EditText;

.field final synthetic val$syncCb:Landroid/widget/CheckBox;

.field final synthetic val$urlEt:Landroid/widget/EditText;


# direct methods
.method constructor <init>(Landroid/widget/EditText;Landroid/widget/EditText;Landroid/content/Context;Landroid/widget/CheckBox;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 154
    iput-object p1, p0, Lcom/flyersoft/components/Readwise$4;->val$urlEt:Landroid/widget/EditText;

    iput-object p2, p0, Lcom/flyersoft/components/Readwise$4;->val$et:Landroid/widget/EditText;

    iput-object p3, p0, Lcom/flyersoft/components/Readwise$4;->val$context:Landroid/content/Context;

    iput-object p4, p0, Lcom/flyersoft/components/Readwise$4;->val$syncCb:Landroid/widget/CheckBox;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 7

    .line 157
    iget-object p1, p0, Lcom/flyersoft/components/Readwise$4;->val$urlEt:Landroid/widget/EditText;

    invoke-virtual {p1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p1

    sput-object p1, Lcom/flyersoft/tools/A;->readWiseUrl:Ljava/lang/String;

    .line 158
    iget-object p1, p0, Lcom/flyersoft/components/Readwise$4;->val$et:Landroid/widget/EditText;

    invoke-virtual {p1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p1

    sget-object p2, Lcom/flyersoft/tools/A;->readWiseToken:Ljava/lang/String;

    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_0

    .line 159
    iget-object p1, p0, Lcom/flyersoft/components/Readwise$4;->val$et:Landroid/widget/EditText;

    invoke-virtual {p1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p1

    sput-object p1, Lcom/flyersoft/tools/A;->readWiseToken:Ljava/lang/String;

    .line 160
    iget-object p1, p0, Lcom/flyersoft/components/Readwise$4;->val$context:Landroid/content/Context;

    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v0, p0, Lcom/flyersoft/components/Readwise$4;->val$context:Landroid/content/Context;

    sget v1, Lcom/flyersoft/moonreaderp/R$string;->share:I

    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, " \"test highlight\" -> Readwise"

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    const/4 v0, 0x1

    invoke-static {p1, p2, v0}, Lcom/flyersoft/tools/T;->showToastText(Landroid/content/Context;Ljava/lang/CharSequence;I)V

    .line 161
    new-instance v1, Lcom/flyersoft/components/Readwise$WiseItem;

    const-string v5, "test note"

    const-string v6, ""

    const-string v2, "test"

    const-string v3, "moonreader"

    const-string v4, "test highlight"

    invoke-direct/range {v1 .. v6}, Lcom/flyersoft/components/Readwise$WiseItem;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    new-instance p1, Lcom/flyersoft/components/Readwise$4$1;

    invoke-direct {p1, p0}, Lcom/flyersoft/components/Readwise$4$1;-><init>(Lcom/flyersoft/components/Readwise$4;)V

    invoke-static {v1, p1}, Lcom/flyersoft/components/Readwise;->addHighlight(Lcom/flyersoft/components/Readwise$WiseItem;Lcom/flyersoft/components/Readwise$UploadResult;)V

    :cond_0
    return-void
.end method
