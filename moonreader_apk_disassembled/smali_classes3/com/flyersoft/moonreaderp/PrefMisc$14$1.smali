.class Lcom/flyersoft/moonreaderp/PrefMisc$14$1;
.super Ljava/lang/Object;
.source "PrefMisc.java"

# interfaces
.implements Landroid/app/TimePickerDialog$OnTimeSetListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/PrefMisc$14;->onClick(Landroid/view/View;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/flyersoft/moonreaderp/PrefMisc$14;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/PrefMisc$14;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 640
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefMisc$14$1;->this$1:Lcom/flyersoft/moonreaderp/PrefMisc$14;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onTimeSet(Landroid/widget/TimePicker;II)V
    .locals 0

    .line 642
    sput p2, Lcom/flyersoft/tools/A;->remind2TimeHour:I

    .line 643
    sput p3, Lcom/flyersoft/tools/A;->remind2TimeMinute:I

    .line 644
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefMisc$14$1;->this$1:Lcom/flyersoft/moonreaderp/PrefMisc$14;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/PrefMisc$14;->val$view:Landroid/view/View;

    sget p2, Lcom/flyersoft/moonreaderp/R$id;->pmRemind2Time:I

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/EditText;

    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    sget p3, Lcom/flyersoft/tools/A;->remind2TimeHour:I

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p3, ":"

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget p3, Lcom/flyersoft/tools/A;->remind2TimeMinute:I

    .line 645
    invoke-static {p3}, Lcom/flyersoft/tools/T;->getMinuteTag(I)Ljava/lang/String;

    move-result-object p3

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    return-void
.end method
