.class Lcom/flyersoft/moonreaderp/PrefShelfFilter$2;
.super Ljava/lang/Object;
.source "PrefShelfFilter.java"

# interfaces
.implements Landroid/widget/RadioGroup$OnCheckedChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/PrefShelfFilter;->initView()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/moonreaderp/PrefShelfFilter;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/PrefShelfFilter;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 121
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefShelfFilter$2;->this$0:Lcom/flyersoft/moonreaderp/PrefShelfFilter;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onCheckedChanged(Landroid/widget/RadioGroup;I)V
    .locals 0

    .line 123
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefShelfFilter$2;->this$0:Lcom/flyersoft/moonreaderp/PrefShelfFilter;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/PrefShelfFilter;->root:Landroid/view/View;

    iget-object p2, p0, Lcom/flyersoft/moonreaderp/PrefShelfFilter$2;->this$0:Lcom/flyersoft/moonreaderp/PrefShelfFilter;

    iget-object p2, p2, Lcom/flyersoft/moonreaderp/PrefShelfFilter;->sortRG:Landroid/widget/RadioGroup;

    invoke-virtual {p2}, Landroid/widget/RadioGroup;->getCheckedRadioButtonId()I

    move-result p2

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/String;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    sput p1, Lcom/flyersoft/tools/A;->shelf_sort_by:I

    .line 124
    invoke-static {}, Lcom/flyersoft/tools/BookDb;->clearAllBooks()V

    .line 125
    sget-object p1, Lcom/flyersoft/moonreaderp/ActivityMain;->selfPref:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-static {p1}, Lcom/flyersoft/tools/T;->isNull(Landroid/app/Activity;)Z

    move-result p1

    if-nez p1, :cond_0

    .line 126
    sget-object p1, Lcom/flyersoft/moonreaderp/ActivityMain;->selfPref:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-virtual {p1}, Lcom/flyersoft/moonreaderp/ActivityMain;->updateShelf()V

    .line 127
    :cond_0
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefShelfFilter$2;->this$0:Lcom/flyersoft/moonreaderp/PrefShelfFilter;

    invoke-static {p1}, Lcom/flyersoft/moonreaderp/PrefShelfFilter;->-$$Nest$msetClearArbitrayTvVisible(Lcom/flyersoft/moonreaderp/PrefShelfFilter;)V

    return-void
.end method
