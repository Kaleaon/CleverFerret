.class Lcom/flyersoft/moonreaderp/PrefBookCalendar$6;
.super Ljava/lang/Object;
.source "PrefBookCalendar.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/PrefBookCalendar;->setDateSelecteEvent()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/moonreaderp/PrefBookCalendar;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/PrefBookCalendar;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 325
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefBookCalendar$6;->this$0:Lcom/flyersoft/moonreaderp/PrefBookCalendar;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 10

    .line 328
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object p1

    .line 329
    new-instance v0, Ljava/util/Date;

    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefBookCalendar$6;->this$0:Lcom/flyersoft/moonreaderp/PrefBookCalendar;

    iget-wide v1, v1, Lcom/flyersoft/moonreaderp/PrefBookCalendar;->start_time:J

    invoke-direct {v0, v1, v2}, Ljava/util/Date;-><init>(J)V

    invoke-virtual {p1, v0}, Ljava/util/Calendar;->setTime(Ljava/util/Date;)V

    .line 330
    new-instance v3, Landroid/app/DatePickerDialog;

    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefBookCalendar$6;->this$0:Lcom/flyersoft/moonreaderp/PrefBookCalendar;

    iget-object v4, v0, Lcom/flyersoft/moonreaderp/PrefBookCalendar;->con:Landroid/content/Context;

    .line 331
    sget-boolean v0, Lcom/flyersoft/tools/A;->mainNightTheme:Z

    const/4 v1, 0x5

    if-eqz v0, :cond_0

    const/4 v0, 0x4

    const/4 v5, 0x4

    goto :goto_0

    :cond_0
    const/4 v5, 0x5

    :goto_0
    new-instance v6, Lcom/flyersoft/moonreaderp/PrefBookCalendar$6$1;

    invoke-direct {v6, p0}, Lcom/flyersoft/moonreaderp/PrefBookCalendar$6$1;-><init>(Lcom/flyersoft/moonreaderp/PrefBookCalendar$6;)V

    const/4 v0, 0x1

    .line 342
    invoke-virtual {p1, v0}, Ljava/util/Calendar;->get(I)I

    move-result v7

    const/4 v0, 0x2

    invoke-virtual {p1, v0}, Ljava/util/Calendar;->get(I)I

    move-result v8

    invoke-virtual {p1, v1}, Ljava/util/Calendar;->get(I)I

    move-result v9

    invoke-direct/range {v3 .. v9}, Landroid/app/DatePickerDialog;-><init>(Landroid/content/Context;ILandroid/app/DatePickerDialog$OnDateSetListener;III)V

    .line 343
    invoke-virtual {v3}, Landroid/app/DatePickerDialog;->show()V

    .line 344
    sget-boolean p1, Lcom/flyersoft/tools/A;->mainNightTheme:Z

    if-eqz p1, :cond_1

    .line 345
    invoke-static {v3}, Lcom/flyersoft/tools/A;->setDialogButtonColor(Landroid/app/AlertDialog;)V

    :cond_1
    return-void
.end method
