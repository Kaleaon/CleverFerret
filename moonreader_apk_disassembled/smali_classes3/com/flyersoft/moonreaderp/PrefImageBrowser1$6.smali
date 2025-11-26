.class Lcom/flyersoft/moonreaderp/PrefImageBrowser1$6;
.super Ljava/lang/Object;
.source "PrefImageBrowser1.java"

# interfaces
.implements Lcom/flyersoft/tools/T$FileResultOK;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/PrefImageBrowser1;->onClick(Landroid/view/View;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/moonreaderp/PrefImageBrowser1;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/PrefImageBrowser1;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 294
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefImageBrowser1$6;->this$0:Lcom/flyersoft/moonreaderp/PrefImageBrowser1;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public isResultOk(Ljava/lang/String;)Z
    .locals 2

    .line 297
    invoke-static {p1}, Lcom/flyersoft/tools/T;->isNull(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 298
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefImageBrowser1$6;->this$0:Lcom/flyersoft/moonreaderp/PrefImageBrowser1;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/PrefImageBrowser1;->onSaveImage:Lcom/flyersoft/moonreaderp/PrefImageBrowser1$OnSaveImage;

    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefImageBrowser1$6;->this$0:Lcom/flyersoft/moonreaderp/PrefImageBrowser1;

    iget-object v1, v1, Lcom/flyersoft/moonreaderp/PrefImageBrowser1;->outerPath:Ljava/lang/String;

    invoke-interface {v0, p1, v1}, Lcom/flyersoft/moonreaderp/PrefImageBrowser1$OnSaveImage;->onGetImageFile(Ljava/lang/String;Ljava/lang/String;)V

    .line 299
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefImageBrowser1$6;->this$0:Lcom/flyersoft/moonreaderp/PrefImageBrowser1;

    const/4 v0, 0x1

    iput-boolean v0, p1, Lcom/flyersoft/moonreaderp/PrefImageBrowser1;->done:Z

    .line 300
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefImageBrowser1$6;->this$0:Lcom/flyersoft/moonreaderp/PrefImageBrowser1;

    invoke-virtual {p1}, Lcom/flyersoft/moonreaderp/PrefImageBrowser1;->dismiss()V

    :cond_0
    const/4 p1, 0x0

    return p1
.end method
