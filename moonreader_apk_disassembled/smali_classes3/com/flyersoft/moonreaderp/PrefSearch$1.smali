.class Lcom/flyersoft/moonreaderp/PrefSearch$1;
.super Ljava/lang/Object;
.source "PrefSearch.java"

# interfaces
.implements Landroid/widget/TextView$OnEditorActionListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/PrefSearch;->initView()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/moonreaderp/PrefSearch;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/PrefSearch;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 103
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefSearch$1;->this$0:Lcom/flyersoft/moonreaderp/PrefSearch;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onEditorAction(Landroid/widget/TextView;ILandroid/view/KeyEvent;)Z
    .locals 0

    const/4 p1, 0x3

    if-ne p2, p1, :cond_0

    .line 106
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefSearch$1;->this$0:Lcom/flyersoft/moonreaderp/PrefSearch;

    iget-object p2, p1, Lcom/flyersoft/moonreaderp/PrefSearch;->searchB:Landroid/widget/ImageButton;

    invoke-virtual {p1, p2}, Lcom/flyersoft/moonreaderp/PrefSearch;->onClick(Landroid/view/View;)V

    :cond_0
    const/4 p1, 0x0

    return p1
.end method
