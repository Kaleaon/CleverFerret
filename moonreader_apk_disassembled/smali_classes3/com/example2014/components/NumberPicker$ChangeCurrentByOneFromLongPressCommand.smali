.class Lcom/example2014/components/NumberPicker$ChangeCurrentByOneFromLongPressCommand;
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
    name = "ChangeCurrentByOneFromLongPressCommand"
.end annotation


# instance fields
.field private mIncrement:Z

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

    .line 2154
    iput-object p1, p0, Lcom/example2014/components/NumberPicker$ChangeCurrentByOneFromLongPressCommand;->this$0:Lcom/example2014/components/NumberPicker;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$400(Lcom/example2014/components/NumberPicker$ChangeCurrentByOneFromLongPressCommand;Z)V
    .locals 0

    .line 2154
    invoke-direct {p0, p1}, Lcom/example2014/components/NumberPicker$ChangeCurrentByOneFromLongPressCommand;->setStep(Z)V

    return-void
.end method

.method private setStep(Z)V
    .locals 0

    .line 2158
    iput-boolean p1, p0, Lcom/example2014/components/NumberPicker$ChangeCurrentByOneFromLongPressCommand;->mIncrement:Z

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .line 2163
    iget-object v0, p0, Lcom/example2014/components/NumberPicker$ChangeCurrentByOneFromLongPressCommand;->this$0:Lcom/example2014/components/NumberPicker;

    iget-boolean v1, p0, Lcom/example2014/components/NumberPicker$ChangeCurrentByOneFromLongPressCommand;->mIncrement:Z

    invoke-static {v0, v1}, Lcom/example2014/components/NumberPicker;->access$100(Lcom/example2014/components/NumberPicker;Z)V

    .line 2164
    iget-object v0, p0, Lcom/example2014/components/NumberPicker$ChangeCurrentByOneFromLongPressCommand;->this$0:Lcom/example2014/components/NumberPicker;

    invoke-static {v0}, Lcom/example2014/components/NumberPicker;->access$1400(Lcom/example2014/components/NumberPicker;)J

    move-result-wide v1

    invoke-virtual {v0, p0, v1, v2}, Lcom/example2014/components/NumberPicker;->postDelayed(Ljava/lang/Runnable;J)Z

    return-void
.end method
