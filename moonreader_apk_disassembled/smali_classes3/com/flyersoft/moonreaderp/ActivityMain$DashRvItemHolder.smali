.class Lcom/flyersoft/moonreaderp/ActivityMain$DashRvItemHolder;
.super Landroidx/recyclerview/widget/RecyclerView$ViewHolder;
.source "ActivityMain.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flyersoft/moonreaderp/ActivityMain;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "DashRvItemHolder"
.end annotation


# instance fields
.field base:Landroid/view/View;

.field position:I

.field final synthetic this$0:Lcom/flyersoft/moonreaderp/ActivityMain;


# direct methods
.method public constructor <init>(Lcom/flyersoft/moonreaderp/ActivityMain;Landroid/view/View;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010,
            0x0
        }
        names = {
            null,
            null
        }
    .end annotation

    .line 10493
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$DashRvItemHolder;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    .line 10494
    invoke-direct {p0, p2}, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;-><init>(Landroid/view/View;)V

    .line 10495
    iput-object p2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$DashRvItemHolder;->base:Landroid/view/View;

    return-void
.end method
