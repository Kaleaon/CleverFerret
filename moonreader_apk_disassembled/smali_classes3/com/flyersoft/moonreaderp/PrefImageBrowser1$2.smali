.class Lcom/flyersoft/moonreaderp/PrefImageBrowser1$2;
.super Ljava/lang/Object;
.source "PrefImageBrowser1.java"

# interfaces
.implements Landroid/widget/AdapterView$OnItemClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/PrefImageBrowser1;->initView()V
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

    .line 99
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefImageBrowser1$2;->this$0:Lcom/flyersoft/moonreaderp/PrefImageBrowser1;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onItemClick(Landroid/widget/AdapterView;Landroid/view/View;IJ)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/widget/AdapterView<",
            "*>;",
            "Landroid/view/View;",
            "IJ)V"
        }
    .end annotation

    .line 101
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefImageBrowser1$2;->this$0:Lcom/flyersoft/moonreaderp/PrefImageBrowser1;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/PrefImageBrowser1;->images:Ljava/util/ArrayList;

    invoke-virtual {p1, p3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/flyersoft/tools/A$MyDrawable;

    .line 102
    iget-object p2, p0, Lcom/flyersoft/moonreaderp/PrefImageBrowser1$2;->this$0:Lcom/flyersoft/moonreaderp/PrefImageBrowser1;

    iget-object p2, p2, Lcom/flyersoft/moonreaderp/PrefImageBrowser1;->onSaveImage:Lcom/flyersoft/moonreaderp/PrefImageBrowser1$OnSaveImage;

    iget p3, p1, Lcom/flyersoft/tools/A$MyDrawable;->from:I

    if-nez p3, :cond_0

    iget-object p1, p1, Lcom/flyersoft/tools/A$MyDrawable;->filename:Ljava/lang/String;

    goto :goto_0

    :cond_0
    iget-object p1, p1, Lcom/flyersoft/tools/A$MyDrawable;->imageName:Ljava/lang/String;

    :goto_0
    iget-object p3, p0, Lcom/flyersoft/moonreaderp/PrefImageBrowser1$2;->this$0:Lcom/flyersoft/moonreaderp/PrefImageBrowser1;

    iget-object p3, p3, Lcom/flyersoft/moonreaderp/PrefImageBrowser1;->outerPath:Ljava/lang/String;

    invoke-interface {p2, p1, p3}, Lcom/flyersoft/moonreaderp/PrefImageBrowser1$OnSaveImage;->onGetImageFile(Ljava/lang/String;Ljava/lang/String;)V

    .line 103
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefImageBrowser1$2;->this$0:Lcom/flyersoft/moonreaderp/PrefImageBrowser1;

    const/4 p2, 0x1

    iput-boolean p2, p1, Lcom/flyersoft/moonreaderp/PrefImageBrowser1;->done:Z

    .line 104
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefImageBrowser1$2;->this$0:Lcom/flyersoft/moonreaderp/PrefImageBrowser1;

    invoke-virtual {p1}, Lcom/flyersoft/moonreaderp/PrefImageBrowser1;->dismiss()V

    return-void
.end method
