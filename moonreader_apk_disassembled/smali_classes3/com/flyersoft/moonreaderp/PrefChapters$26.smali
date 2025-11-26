.class Lcom/flyersoft/moonreaderp/PrefChapters$26;
.super Ljava/lang/Object;
.source "PrefChapters.java"

# interfaces
.implements Landroid/widget/RadioGroup$OnCheckedChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/PrefChapters;->showCnChapterNumOptions()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/moonreaderp/PrefChapters;

.field final synthetic val$lay:Landroid/view/View;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/PrefChapters;Landroid/view/View;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010,
            0x1010
        }
        names = {
            null,
            null
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 2512
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefChapters$26;->this$0:Lcom/flyersoft/moonreaderp/PrefChapters;

    iput-object p2, p0, Lcom/flyersoft/moonreaderp/PrefChapters$26;->val$lay:Landroid/view/View;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onCheckedChanged(Landroid/widget/RadioGroup;I)V
    .locals 0

    .line 2515
    iget-object p2, p0, Lcom/flyersoft/moonreaderp/PrefChapters$26;->val$lay:Landroid/view/View;

    invoke-virtual {p1}, Landroid/widget/RadioGroup;->getCheckedRadioButtonId()I

    move-result p1

    invoke-virtual {p2, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/String;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object p1

    .line 2516
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    sput p1, Lcom/flyersoft/tools/A;->cnChapterNumLevel:I

    .line 2517
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefChapters$26;->this$0:Lcom/flyersoft/moonreaderp/PrefChapters;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/PrefChapters;->chapterAdapter:Lcom/flyersoft/moonreaderp/PrefChapters$ChapterAdapter;

    if-eqz p1, :cond_0

    .line 2518
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefChapters$26;->this$0:Lcom/flyersoft/moonreaderp/PrefChapters;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/PrefChapters;->chapterAdapter:Lcom/flyersoft/moonreaderp/PrefChapters$ChapterAdapter;

    invoke-virtual {p1}, Lcom/flyersoft/moonreaderp/PrefChapters$ChapterAdapter;->notifyDataSetChanged()V

    .line 2519
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefChapters$26;->this$0:Lcom/flyersoft/moonreaderp/PrefChapters;

    invoke-static {p1}, Lcom/flyersoft/moonreaderp/PrefChapters;->-$$Nest$mshowCurChapterIndicator(Lcom/flyersoft/moonreaderp/PrefChapters;)V

    :cond_0
    return-void
.end method
