.class Lcom/flyersoft/moonreaderp/PrefImageBrowser1$5;
.super Ljava/lang/Object;
.source "PrefImageBrowser1.java"

# interfaces
.implements Lcom/flyersoft/moonreaderp/PrefDownloadCover$OnSaveImage;


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

    .line 279
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefImageBrowser1$5;->this$0:Lcom/flyersoft/moonreaderp/PrefImageBrowser1;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onGetImageFile(Ljava/lang/String;Landroid/graphics/drawable/Drawable;)V
    .locals 1

    if-nez p2, :cond_0

    goto :goto_0

    .line 283
    :cond_0
    invoke-static {p2, p1}, Lcom/flyersoft/tools/T;->drawableToFile(Landroid/graphics/drawable/Drawable;Ljava/lang/String;)Z

    move-result p2

    if-nez p2, :cond_1

    :goto_0
    return-void

    .line 285
    :cond_1
    iget-object p2, p0, Lcom/flyersoft/moonreaderp/PrefImageBrowser1$5;->this$0:Lcom/flyersoft/moonreaderp/PrefImageBrowser1;

    iget-object p2, p2, Lcom/flyersoft/moonreaderp/PrefImageBrowser1;->onSaveImage:Lcom/flyersoft/moonreaderp/PrefImageBrowser1$OnSaveImage;

    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefImageBrowser1$5;->this$0:Lcom/flyersoft/moonreaderp/PrefImageBrowser1;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/PrefImageBrowser1;->outerPath:Ljava/lang/String;

    invoke-interface {p2, p1, v0}, Lcom/flyersoft/moonreaderp/PrefImageBrowser1$OnSaveImage;->onGetImageFile(Ljava/lang/String;Ljava/lang/String;)V

    .line 286
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefImageBrowser1$5;->this$0:Lcom/flyersoft/moonreaderp/PrefImageBrowser1;

    const/4 p2, 0x1

    iput-boolean p2, p1, Lcom/flyersoft/moonreaderp/PrefImageBrowser1;->done:Z

    .line 287
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefImageBrowser1$5;->this$0:Lcom/flyersoft/moonreaderp/PrefImageBrowser1;

    invoke-virtual {p1}, Lcom/flyersoft/moonreaderp/PrefImageBrowser1;->dismiss()V

    return-void
.end method
