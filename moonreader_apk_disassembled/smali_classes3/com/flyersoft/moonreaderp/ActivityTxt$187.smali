.class Lcom/flyersoft/moonreaderp/ActivityTxt$187;
.super Ljava/lang/Object;
.source "ActivityTxt.java"

# interfaces
.implements Lcom/flyersoft/components/MyMenu$MenuItemClick;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/ActivityTxt;->doChaptersLongTap(Landroid/view/View;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/ActivityTxt;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 18411
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$187;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(I)V
    .locals 2

    if-nez p1, :cond_0

    .line 18414
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$187;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->do_show_chapters(I)V

    :cond_0
    const/4 v0, 0x1

    if-ne p1, v0, :cond_1

    .line 18416
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$187;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {v0}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$mdo_prior_chapter(Lcom/flyersoft/moonreaderp/ActivityTxt;)V

    :cond_1
    const/4 v0, 0x2

    if-ne p1, v0, :cond_2

    .line 18418
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$187;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {p1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$mdo_next_chapter(Lcom/flyersoft/moonreaderp/ActivityTxt;)V

    :cond_2
    return-void
.end method
