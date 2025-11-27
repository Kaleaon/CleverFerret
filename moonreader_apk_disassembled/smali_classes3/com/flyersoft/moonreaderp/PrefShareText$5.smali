.class Lcom/flyersoft/moonreaderp/PrefShareText$5;
.super Landroidx/recyclerview/widget/RecyclerView$OnScrollListener;
.source "PrefShareText.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/PrefShareText;->createSlideAdapter()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/moonreaderp/PrefShareText;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/PrefShareText;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 315
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefShareText$5;->this$0:Lcom/flyersoft/moonreaderp/PrefShareText;

    invoke-direct {p0}, Landroidx/recyclerview/widget/RecyclerView$OnScrollListener;-><init>()V

    return-void
.end method


# virtual methods
.method public onScrollStateChanged(Landroidx/recyclerview/widget/RecyclerView;I)V
    .locals 0

    if-nez p2, :cond_0

    .line 319
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefShareText$5;->this$0:Lcom/flyersoft/moonreaderp/PrefShareText;

    invoke-static {p1}, Lcom/flyersoft/moonreaderp/PrefShareText;->-$$Nest$monActiveCardChange(Lcom/flyersoft/moonreaderp/PrefShareText;)V

    :cond_0
    return-void
.end method
