.class Lcom/example2014/components/NumberPicker$BeginSoftInputOnLongPressCommand;
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
    name = "BeginSoftInputOnLongPressCommand"
.end annotation


# instance fields
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

    .line 2193
    iput-object p1, p0, Lcom/example2014/components/NumberPicker$BeginSoftInputOnLongPressCommand;->this$0:Lcom/example2014/components/NumberPicker;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .line 2197
    iget-object v0, p0, Lcom/example2014/components/NumberPicker$BeginSoftInputOnLongPressCommand;->this$0:Lcom/example2014/components/NumberPicker;

    invoke-static {v0}, Lcom/example2014/components/NumberPicker;->access$1500(Lcom/example2014/components/NumberPicker;)V

    .line 2198
    iget-object v0, p0, Lcom/example2014/components/NumberPicker$BeginSoftInputOnLongPressCommand;->this$0:Lcom/example2014/components/NumberPicker;

    const/4 v1, 0x1

    invoke-static {v0, v1}, Lcom/example2014/components/NumberPicker;->access$1602(Lcom/example2014/components/NumberPicker;Z)Z

    return-void
.end method
