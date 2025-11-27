.class Lcom/flyersoft/components/DualFavLay$1;
.super Ljava/lang/Object;
.source "DualFavLay.java"

# interfaces
.implements Landroid/widget/PopupWindow$OnDismissListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/components/DualFavLay;-><init>(Landroid/content/Context;Landroid/view/View;Lcom/flyersoft/components/DualFavLay$MainItemClick;Lcom/flyersoft/components/DualFavLay$SubItemClick;)V
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

    .line 93
    iput-object p1, p0, Lcom/flyersoft/components/DualFavLay$1;->this$0:Lcom/flyersoft/components/DualFavLay;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onDismiss()V
    .locals 2

    .line 95
    iget-object v0, p0, Lcom/flyersoft/components/DualFavLay$1;->this$0:Lcom/flyersoft/components/DualFavLay;

    invoke-static {v0}, Lcom/flyersoft/components/DualFavLay;->-$$Nest$msaveLastSub(Lcom/flyersoft/components/DualFavLay;)V

    const/4 v0, 0x0

    .line 96
    sput-object v0, Lcom/flyersoft/components/DualFavLay;->selfPref:Lcom/flyersoft/components/DualFavLay;

    .line 97
    iget-object v1, p0, Lcom/flyersoft/components/DualFavLay$1;->this$0:Lcom/flyersoft/components/DualFavLay;

    iput-object v0, v1, Lcom/flyersoft/components/DualFavLay;->allBooks:Ljava/util/ArrayList;

    const/4 v0, 0x1

    .line 98
    invoke-static {v0}, Lcom/flyersoft/tools/A;->setSystemUiVisibility(Z)V

    return-void
.end method
