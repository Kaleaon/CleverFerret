.class Lcom/flyersoft/moonreaderp/PrefChapters$16;
.super Ljava/lang/Object;
.source "PrefChapters.java"

# interfaces
.implements Landroid/view/View$OnLongClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/PrefChapters;->show_bookmark(Z)Landroid/view/View;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/moonreaderp/PrefChapters;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/PrefChapters;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 1042
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefChapters$16;->this$0:Lcom/flyersoft/moonreaderp/PrefChapters;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onLongClick(Landroid/view/View;)Z
    .locals 1

    .line 1045
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefChapters$16;->this$0:Lcom/flyersoft/moonreaderp/PrefChapters;

    const/4 v0, 0x0

    invoke-static {p1, v0}, Lcom/flyersoft/moonreaderp/PrefChapters;->-$$Nest$maddNewFavorites(Lcom/flyersoft/moonreaderp/PrefChapters;Z)V

    const/4 p1, 0x1

    return p1
.end method
