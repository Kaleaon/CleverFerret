.class Lcom/example2014/components/NumberPicker$SetSelectionCommand;
.super Ljava/lang/Object;
.source "NumberPicker.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/example2014/components/NumberPicker;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "SetSelectionCommand"
.end annotation


# instance fields
.field private mSelectionEnd:I

.field private mSelectionStart:I

.field final synthetic this$0:Lcom/example2014/components/NumberPicker;


# direct methods
.method constructor <init>(Lcom/example2014/components/NumberPicker;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 2141
    iput-object p1, p0, Lcom/example2014/components/NumberPicker$SetSelectionCommand;->this$0:Lcom/example2014/components/NumberPicker;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$502(Lcom/example2014/components/NumberPicker$SetSelectionCommand;I)I
    .locals 0

    .line 2141
    iput p1, p0, Lcom/example2014/components/NumberPicker$SetSelectionCommand;->mSelectionStart:I

    return p1
.end method

.method static synthetic access$602(Lcom/example2014/components/NumberPicker$SetSelectionCommand;I)I
    .locals 0

    .line 2141
    iput p1, p0, Lcom/example2014/components/NumberPicker$SetSelectionCommand;->mSelectionEnd:I

    return p1
.end method


# virtual methods
.method public run()V
    .locals 3

    .line 2147
    iget-object v0, p0, Lcom/example2014/components/NumberPicker$SetSelectionCommand;->this$0:Lcom/example2014/components/NumberPicker;

    iget-object v0, v0, Lcom/example2014/components/NumberPicker;->mInputText:Landroid/widget/EditText;

    iget v1, p0, Lcom/example2014/components/NumberPicker$SetSelectionCommand;->mSelectionStart:I

    iget v2, p0, Lcom/example2014/components/NumberPicker$SetSelectionCommand;->mSelectionEnd:I

    invoke-virtual {v0, v1, v2}, Landroid/widget/EditText;->setSelection(II)V

    return-void
.end method
