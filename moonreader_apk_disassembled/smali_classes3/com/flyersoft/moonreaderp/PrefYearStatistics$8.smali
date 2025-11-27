.class Lcom/flyersoft/moonreaderp/PrefYearStatistics$8;
.super Ljava/lang/Object;
.source "PrefYearStatistics.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/PrefYearStatistics;->showOptions(II)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/moonreaderp/PrefYearStatistics;

.field final synthetic val$et:Landroid/widget/EditText;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/PrefYearStatistics;Landroid/widget/EditText;)V
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

    .line 727
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefYearStatistics$8;->this$0:Lcom/flyersoft/moonreaderp/PrefYearStatistics;

    iput-object p2, p0, Lcom/flyersoft/moonreaderp/PrefYearStatistics$8;->val$et:Landroid/widget/EditText;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 0

    .line 730
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefYearStatistics$8;->val$et:Landroid/widget/EditText;

    invoke-virtual {p1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Lcom/flyersoft/tools/T;->string2Float(Ljava/lang/String;)F

    move-result p1

    sput p1, Lcom/flyersoft/tools/A;->year_book_time:F

    .line 731
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefYearStatistics$8;->this$0:Lcom/flyersoft/moonreaderp/PrefYearStatistics;

    invoke-static {p1}, Lcom/flyersoft/moonreaderp/PrefYearStatistics;->-$$Nest$mfillStatistics(Lcom/flyersoft/moonreaderp/PrefYearStatistics;)V

    return-void
.end method
