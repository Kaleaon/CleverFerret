.class Lcom/flyersoft/moonreaderp/PrefChapters$5;
.super Ljava/lang/Object;
.source "PrefChapters.java"

# interfaces
.implements Landroidx/appcompat/widget/SearchView$OnCloseListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/PrefChapters;->initTocSearch()V
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

    .line 402
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefChapters$5;->this$0:Lcom/flyersoft/moonreaderp/PrefChapters;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClose()Z
    .locals 3

    .line 404
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefChapters$5;->this$0:Lcom/flyersoft/moonreaderp/PrefChapters;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/PrefChapters;->chapterTV:Landroid/widget/TextView;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setVisibility(I)V

    .line 405
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefChapters$5;->this$0:Lcom/flyersoft/moonreaderp/PrefChapters;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/PrefChapters;->expandIv:Landroid/widget/ImageView;

    invoke-virtual {v0}, Landroid/widget/ImageView;->getTag()Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 406
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefChapters$5;->this$0:Lcom/flyersoft/moonreaderp/PrefChapters;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/PrefChapters;->expandIv:Landroid/widget/ImageView;

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 407
    :cond_0
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefChapters$5;->this$0:Lcom/flyersoft/moonreaderp/PrefChapters;

    const/4 v2, 0x0

    iput-object v2, v0, Lcom/flyersoft/moonreaderp/PrefChapters;->tocSearchKey:Ljava/lang/String;

    .line 408
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefChapters$5;->this$0:Lcom/flyersoft/moonreaderp/PrefChapters;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/PrefChapters;->chapterAdapter:Lcom/flyersoft/moonreaderp/PrefChapters$ChapterAdapter;

    invoke-virtual {v0}, Lcom/flyersoft/moonreaderp/PrefChapters$ChapterAdapter;->createToc()V

    .line 409
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefChapters$5;->this$0:Lcom/flyersoft/moonreaderp/PrefChapters;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/PrefChapters;->chapterAdapter:Lcom/flyersoft/moonreaderp/PrefChapters$ChapterAdapter;

    invoke-virtual {v0}, Lcom/flyersoft/moonreaderp/PrefChapters$ChapterAdapter;->notifyDataSetChanged()V

    return v1
.end method
