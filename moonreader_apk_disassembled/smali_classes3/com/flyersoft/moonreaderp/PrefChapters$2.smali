.class Lcom/flyersoft/moonreaderp/PrefChapters$2;
.super Ljava/lang/Object;
.source "PrefChapters.java"

# interfaces
.implements Landroidx/viewpager/widget/ViewPager$OnPageChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/PrefChapters;->initView()V
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

    .line 212
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefChapters$2;->this$0:Lcom/flyersoft/moonreaderp/PrefChapters;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onPageScrollStateChanged(I)V
    .locals 0

    return-void
.end method

.method public onPageScrolled(IFI)V
    .locals 0

    return-void
.end method

.method public onPageSelected(I)V
    .locals 1

    .line 218
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefChapters$2;->this$0:Lcom/flyersoft/moonreaderp/PrefChapters;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/PrefChapters;->mainPagerInflater:Landroid/view/LayoutInflater;

    if-eqz v0, :cond_0

    .line 219
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefChapters$2;->this$0:Lcom/flyersoft/moonreaderp/PrefChapters;

    invoke-static {v0, p1}, Lcom/flyersoft/moonreaderp/PrefChapters;->-$$Nest$mupdateTabContent(Lcom/flyersoft/moonreaderp/PrefChapters;I)V

    .line 220
    :cond_0
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefChapters$2;->this$0:Lcom/flyersoft/moonreaderp/PrefChapters;

    invoke-static {v0}, Lcom/flyersoft/moonreaderp/PrefChapters;->-$$Nest$msetNoteDeleteVisble(Lcom/flyersoft/moonreaderp/PrefChapters;)V

    .line 221
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefChapters$2;->this$0:Lcom/flyersoft/moonreaderp/PrefChapters;

    invoke-static {v0, p1}, Lcom/flyersoft/moonreaderp/PrefChapters;->-$$Nest$msetTabIndicator(Lcom/flyersoft/moonreaderp/PrefChapters;I)V

    return-void
.end method
