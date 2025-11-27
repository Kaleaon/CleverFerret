.class Lcom/flyersoft/moonreaderp/PrefChapters$8;
.super Ljava/lang/Object;
.source "PrefChapters.java"

# interfaces
.implements Landroidx/appcompat/widget/SearchView$OnCloseListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/PrefChapters;->initBookmarkSearch()V
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

    .line 441
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefChapters$8;->this$0:Lcom/flyersoft/moonreaderp/PrefChapters;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClose()Z
    .locals 3

    .line 443
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefChapters$8;->this$0:Lcom/flyersoft/moonreaderp/PrefChapters;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/PrefChapters;->bookmarkB:Landroid/view/View;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 444
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefChapters$8;->this$0:Lcom/flyersoft/moonreaderp/PrefChapters;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/PrefChapters;->exportB:Landroid/view/View;

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 445
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefChapters$8;->this$0:Lcom/flyersoft/moonreaderp/PrefChapters;

    const/4 v2, 0x0

    iput-object v2, v0, Lcom/flyersoft/moonreaderp/PrefChapters;->annotKey:Ljava/lang/String;

    .line 446
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefChapters$8;->this$0:Lcom/flyersoft/moonreaderp/PrefChapters;

    invoke-virtual {v0}, Lcom/flyersoft/moonreaderp/PrefChapters;->refreshBookmarkList()V

    return v1
.end method
