.class Lcom/flyersoft/moonreaderp/ActivityMain$141;
.super Ljava/lang/Object;
.source "ActivityMain.java"

# interfaces
.implements Landroid/widget/AdapterView$OnItemSelectedListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/ActivityMain;->show_coverflow()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/moonreaderp/ActivityMain;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/ActivityMain;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 13335
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$141;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onItemSelected(Landroid/widget/AdapterView;Landroid/view/View;IJ)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/widget/AdapterView<",
            "*>;",
            "Landroid/view/View;",
            "IJ)V"
        }
    .end annotation

    .line 13337
    sput p3, Lcom/flyersoft/tools/A;->shelf_last_item:I

    .line 13338
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$141;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-static {p1, p3}, Lcom/flyersoft/moonreaderp/ActivityMain;->-$$Nest$mupdateCoverflowBookInfo(Lcom/flyersoft/moonreaderp/ActivityMain;I)V

    return-void
.end method

.method public onNothingSelected(Landroid/widget/AdapterView;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/widget/AdapterView<",
            "*>;)V"
        }
    .end annotation

    return-void
.end method
