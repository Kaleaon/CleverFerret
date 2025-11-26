.class Lcom/flyersoft/components/DualFavLay$2;
.super Ljava/lang/Object;
.source "DualFavLay.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flyersoft/components/DualFavLay;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/components/DualFavLay;


# direct methods
.method constructor <init>(Lcom/flyersoft/components/DualFavLay;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 111
    iput-object p1, p0, Lcom/flyersoft/components/DualFavLay$2;->this$0:Lcom/flyersoft/components/DualFavLay;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 1

    .line 114
    iget-object v0, p0, Lcom/flyersoft/components/DualFavLay$2;->this$0:Lcom/flyersoft/components/DualFavLay;

    invoke-static {v0}, Lcom/flyersoft/components/DualFavLay;->-$$Nest$msaveLastSub(Lcom/flyersoft/components/DualFavLay;)V

    .line 115
    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/String;

    invoke-static {p1}, Lcom/flyersoft/tools/T;->string2Int(Ljava/lang/String;)I

    move-result p1

    if-nez p1, :cond_0

    .line 117
    iget-object p1, p0, Lcom/flyersoft/components/DualFavLay$2;->this$0:Lcom/flyersoft/components/DualFavLay;

    iget-object p1, p1, Lcom/flyersoft/components/DualFavLay;->popupWindow:Landroid/widget/PopupWindow;

    invoke-virtual {p1}, Landroid/widget/PopupWindow;->dismiss()V

    .line 118
    iget-object p1, p0, Lcom/flyersoft/components/DualFavLay$2;->this$0:Lcom/flyersoft/components/DualFavLay;

    iget-object p1, p1, Lcom/flyersoft/components/DualFavLay;->onItemClick1:Lcom/flyersoft/components/DualFavLay$MainItemClick;

    const/4 v0, 0x0

    invoke-interface {p1, v0, v0}, Lcom/flyersoft/components/DualFavLay$MainItemClick;->onClick(IZ)V

    return-void

    .line 120
    :cond_0
    sput p1, Lcom/flyersoft/tools/A;->dualFavType:I

    .line 121
    iget-object p1, p0, Lcom/flyersoft/components/DualFavLay$2;->this$0:Lcom/flyersoft/components/DualFavLay;

    invoke-virtual {p1}, Lcom/flyersoft/components/DualFavLay;->initLay1()V

    return-void
.end method
