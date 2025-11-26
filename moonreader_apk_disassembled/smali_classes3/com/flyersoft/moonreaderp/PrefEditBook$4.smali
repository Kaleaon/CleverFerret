.class Lcom/flyersoft/moonreaderp/PrefEditBook$4;
.super Ljava/lang/Object;
.source "PrefEditBook.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/PrefEditBook;->initView()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/moonreaderp/PrefEditBook;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/PrefEditBook;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 252
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefEditBook$4;->this$0:Lcom/flyersoft/moonreaderp/PrefEditBook;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .line 256
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefEditBook$4;->this$0:Lcom/flyersoft/moonreaderp/PrefEditBook;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/PrefEditBook;->sv:Landroid/widget/ScrollView;

    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefEditBook$4;->this$0:Lcom/flyersoft/moonreaderp/PrefEditBook;

    iget-object v1, v1, Lcom/flyersoft/moonreaderp/PrefEditBook;->favCheck:Landroid/widget/CheckBox;

    invoke-virtual {v1}, Landroid/widget/CheckBox;->getY()F

    move-result v1

    float-to-int v1, v1

    const/4 v2, 0x0

    invoke-virtual {v0, v2, v1}, Landroid/widget/ScrollView;->scrollTo(II)V

    .line 257
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefEditBook$4;->this$0:Lcom/flyersoft/moonreaderp/PrefEditBook;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/PrefEditBook;->favCheck:Landroid/widget/CheckBox;

    invoke-virtual {v0}, Landroid/widget/CheckBox;->getPaint()Landroid/text/TextPaint;

    move-result-object v0

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/text/TextPaint;->setFakeBoldText(Z)V

    .line 258
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefEditBook$4;->this$0:Lcom/flyersoft/moonreaderp/PrefEditBook;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/PrefEditBook;->favEt:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->requestFocus()Z

    return-void
.end method
