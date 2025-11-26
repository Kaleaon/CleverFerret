.class Lcom/flyersoft/moonreaderp/PrefYearStatistics$4;
.super Ljava/lang/Object;
.source "PrefYearStatistics.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/PrefYearStatistics;->initDays(JJ)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/moonreaderp/PrefYearStatistics;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/PrefYearStatistics;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 315
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefYearStatistics$4;->this$0:Lcom/flyersoft/moonreaderp/PrefYearStatistics;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 11

    .line 317
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object v0

    .line 318
    new-instance v1, Ljava/util/Date;

    iget-object v2, p0, Lcom/flyersoft/moonreaderp/PrefYearStatistics$4;->this$0:Lcom/flyersoft/moonreaderp/PrefYearStatistics;

    iget-object v2, v2, Lcom/flyersoft/moonreaderp/PrefYearStatistics;->dateTv1:Landroid/widget/TextView;

    if-ne p1, v2, :cond_0

    iget-object v2, p0, Lcom/flyersoft/moonreaderp/PrefYearStatistics$4;->this$0:Lcom/flyersoft/moonreaderp/PrefYearStatistics;

    iget-wide v2, v2, Lcom/flyersoft/moonreaderp/PrefYearStatistics;->start_date:J

    goto :goto_0

    :cond_0
    iget-object v2, p0, Lcom/flyersoft/moonreaderp/PrefYearStatistics$4;->this$0:Lcom/flyersoft/moonreaderp/PrefYearStatistics;

    iget-wide v2, v2, Lcom/flyersoft/moonreaderp/PrefYearStatistics;->end_date:J

    :goto_0
    invoke-direct {v1, v2, v3}, Ljava/util/Date;-><init>(J)V

    invoke-virtual {v0, v1}, Ljava/util/Calendar;->setTime(Ljava/util/Date;)V

    .line 334
    new-instance v4, Landroid/app/DatePickerDialog;

    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefYearStatistics$4;->this$0:Lcom/flyersoft/moonreaderp/PrefYearStatistics;

    iget-object v5, v1, Lcom/flyersoft/moonreaderp/PrefYearStatistics;->con:Landroid/content/Context;

    .line 335
    sget-boolean v1, Lcom/flyersoft/tools/A;->mainNightTheme:Z

    const/4 v2, 0x5

    if-eqz v1, :cond_1

    const/4 v1, 0x4

    const/4 v6, 0x4

    goto :goto_1

    :cond_1
    const/4 v6, 0x5

    :goto_1
    new-instance v7, Lcom/flyersoft/moonreaderp/PrefYearStatistics$4$1;

    invoke-direct {v7, p0, p1}, Lcom/flyersoft/moonreaderp/PrefYearStatistics$4$1;-><init>(Lcom/flyersoft/moonreaderp/PrefYearStatistics$4;Landroid/view/View;)V

    const/4 p1, 0x1

    .line 360
    invoke-virtual {v0, p1}, Ljava/util/Calendar;->get(I)I

    move-result v8

    const/4 p1, 0x2

    invoke-virtual {v0, p1}, Ljava/util/Calendar;->get(I)I

    move-result v9

    invoke-virtual {v0, v2}, Ljava/util/Calendar;->get(I)I

    move-result v10

    invoke-direct/range {v4 .. v10}, Landroid/app/DatePickerDialog;-><init>(Landroid/content/Context;ILandroid/app/DatePickerDialog$OnDateSetListener;III)V

    .line 361
    invoke-virtual {v4}, Landroid/app/DatePickerDialog;->show()V

    .line 362
    sget-boolean p1, Lcom/flyersoft/tools/A;->mainNightTheme:Z

    if-eqz p1, :cond_2

    .line 363
    invoke-static {v4}, Lcom/flyersoft/tools/A;->setDialogButtonColor(Landroid/app/AlertDialog;)V

    :cond_2
    return-void
.end method
