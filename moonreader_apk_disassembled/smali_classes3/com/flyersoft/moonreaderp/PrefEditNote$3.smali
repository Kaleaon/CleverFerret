.class Lcom/flyersoft/moonreaderp/PrefEditNote$3;
.super Ljava/lang/Object;
.source "PrefEditNote.java"

# interfaces
.implements Lcom/flyersoft/moonreaderp/PrefImageBrowser1$OnSaveImage;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/PrefEditNote;->addLocalImage()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/moonreaderp/PrefEditNote;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/PrefEditNote;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 295
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefEditNote$3;->this$0:Lcom/flyersoft/moonreaderp/PrefEditNote;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onGetImageFile(Ljava/lang/String;Ljava/lang/String;)V
    .locals 3

    .line 297
    invoke-static {p1}, Lcom/flyersoft/tools/T;->isFile(Ljava/lang/String;)Z

    move-result p2

    if-eqz p2, :cond_0

    .line 298
    iget-object p2, p0, Lcom/flyersoft/moonreaderp/PrefEditNote$3;->this$0:Lcom/flyersoft/moonreaderp/PrefEditNote;

    iget-object p2, p2, Lcom/flyersoft/moonreaderp/PrefEditNote;->et:Landroid/widget/EditText;

    invoke-virtual {p2}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object p2

    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefEditNote$3;->this$0:Lcom/flyersoft/moonreaderp/PrefEditNote;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/PrefEditNote;->et:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->getSelectionStart()I

    move-result v0

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "<img src=\""

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, "\">\n"

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-interface {p2, v0, p1}, Landroid/text/Editable;->insert(ILjava/lang/CharSequence;)Landroid/text/Editable;

    :cond_0
    return-void
.end method
