.class Lcom/flyersoft/moonreaderp/PrefTheme$4$1;
.super Ljava/lang/Object;
.source "PrefTheme.java"

# interfaces
.implements Landroid/app/TimePickerDialog$OnTimeSetListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/PrefTheme$4;->onClick(Landroid/view/View;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/flyersoft/moonreaderp/PrefTheme$4;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/PrefTheme$4;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 530
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefTheme$4$1;->this$1:Lcom/flyersoft/moonreaderp/PrefTheme$4;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onTimeSet(Landroid/widget/TimePicker;II)V
    .locals 0

    mul-int/lit8 p2, p2, 0x64

    add-int/2addr p2, p3

    .line 532
    sput p2, Lcom/flyersoft/tools/A;->autoThemeNightTime:I

    .line 533
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefTheme$4$1;->this$1:Lcom/flyersoft/moonreaderp/PrefTheme$4;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/PrefTheme$4;->val$nightTime:Landroid/widget/EditText;

    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    sget p3, Lcom/flyersoft/tools/A;->autoThemeNightTime:I

    div-int/lit8 p3, p3, 0x64

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p3, ":"

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget p3, Lcom/flyersoft/tools/A;->autoThemeNightTime:I

    rem-int/lit8 p3, p3, 0x64

    invoke-static {p3}, Lcom/flyersoft/tools/T;->getMinuteTag(I)Ljava/lang/String;

    move-result-object p3

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    return-void
.end method
