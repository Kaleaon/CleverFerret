.class Lcom/example2014/components/NumberPicker$PressedStateHelper;
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
    name = "PressedStateHelper"
.end annotation


# static fields
.field public static final BUTTON_DECREMENT:I = 0x2

.field public static final BUTTON_INCREMENT:I = 0x1


# instance fields
.field private final MODE_PRESS:I

.field private final MODE_TAPPED:I

.field private mManagedButton:I

.field private mMode:I

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

    .line 2064
    iput-object p1, p0, Lcom/example2014/components/NumberPicker$PressedStateHelper;->this$0:Lcom/example2014/components/NumberPicker;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 p1, 0x1

    .line 2068
    iput p1, p0, Lcom/example2014/components/NumberPicker$PressedStateHelper;->MODE_PRESS:I

    const/4 p1, 0x2

    .line 2069
    iput p1, p0, Lcom/example2014/components/NumberPicker$PressedStateHelper;->MODE_TAPPED:I

    return-void
.end method


# virtual methods
.method public buttonPressDelayed(I)V
    .locals 2

    .line 2086
    invoke-virtual {p0}, Lcom/example2014/components/NumberPicker$PressedStateHelper;->cancel()V

    const/4 v0, 0x1

    .line 2087
    iput v0, p0, Lcom/example2014/components/NumberPicker$PressedStateHelper;->mMode:I

    .line 2088
    iput p1, p0, Lcom/example2014/components/NumberPicker$PressedStateHelper;->mManagedButton:I

    .line 2089
    iget-object p1, p0, Lcom/example2014/components/NumberPicker$PressedStateHelper;->this$0:Lcom/example2014/components/NumberPicker;

    invoke-static {}, Landroid/view/ViewConfiguration;->getTapTimeout()I

    move-result v0

    int-to-long v0, v0

    invoke-virtual {p1, p0, v0, v1}, Lcom/example2014/components/NumberPicker;->postDelayed(Ljava/lang/Runnable;J)Z

    return-void
.end method

.method public buttonTapped(I)V
    .locals 1

    .line 2093
    invoke-virtual {p0}, Lcom/example2014/components/NumberPicker$PressedStateHelper;->cancel()V

    const/4 v0, 0x2

    .line 2094
    iput v0, p0, Lcom/example2014/components/NumberPicker$PressedStateHelper;->mMode:I

    .line 2095
    iput p1, p0, Lcom/example2014/components/NumberPicker$PressedStateHelper;->mManagedButton:I

    .line 2096
    iget-object p1, p0, Lcom/example2014/components/NumberPicker$PressedStateHelper;->this$0:Lcom/example2014/components/NumberPicker;

    invoke-virtual {p1, p0}, Lcom/example2014/components/NumberPicker;->post(Ljava/lang/Runnable;)Z

    return-void
.end method

.method public cancel()V
    .locals 2

    const/4 v0, 0x0

    .line 2075
    iput v0, p0, Lcom/example2014/components/NumberPicker$PressedStateHelper;->mMode:I

    .line 2076
    iput v0, p0, Lcom/example2014/components/NumberPicker$PressedStateHelper;->mManagedButton:I

    .line 2077
    iget-object v1, p0, Lcom/example2014/components/NumberPicker$PressedStateHelper;->this$0:Lcom/example2014/components/NumberPicker;

    invoke-virtual {v1, p0}, Lcom/example2014/components/NumberPicker;->removeCallbacks(Ljava/lang/Runnable;)Z

    .line 2078
    iget-object v1, p0, Lcom/example2014/components/NumberPicker$PressedStateHelper;->this$0:Lcom/example2014/components/NumberPicker;

    invoke-static {v1}, Lcom/example2014/components/NumberPicker;->access$1200(Lcom/example2014/components/NumberPicker;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 2079
    iget-object v1, p0, Lcom/example2014/components/NumberPicker$PressedStateHelper;->this$0:Lcom/example2014/components/NumberPicker;

    invoke-static {v1, v0}, Lcom/example2014/components/NumberPicker;->access$1202(Lcom/example2014/components/NumberPicker;Z)Z

    .line 2080
    iget-object v1, p0, Lcom/example2014/components/NumberPicker$PressedStateHelper;->this$0:Lcom/example2014/components/NumberPicker;

    invoke-virtual {v1}, Lcom/example2014/components/NumberPicker;->invalidate()V

    .line 2082
    :cond_0
    iget-object v1, p0, Lcom/example2014/components/NumberPicker$PressedStateHelper;->this$0:Lcom/example2014/components/NumberPicker;

    invoke-static {v1, v0}, Lcom/example2014/components/NumberPicker;->access$1302(Lcom/example2014/components/NumberPicker;Z)Z

    return-void
.end method

.method public run()V
    .locals 5

    .line 2101
    iget v0, p0, Lcom/example2014/components/NumberPicker$PressedStateHelper;->mMode:I

    const/4 v1, 0x2

    const/4 v2, 0x1

    if-eq v0, v2, :cond_5

    if-eq v0, v1, :cond_0

    goto :goto_0

    .line 2115
    :cond_0
    iget v0, p0, Lcom/example2014/components/NumberPicker$PressedStateHelper;->mManagedButton:I

    if-eq v0, v2, :cond_3

    if-eq v0, v1, :cond_1

    goto :goto_0

    .line 2125
    :cond_1
    iget-object v0, p0, Lcom/example2014/components/NumberPicker$PressedStateHelper;->this$0:Lcom/example2014/components/NumberPicker;

    invoke-static {v0}, Lcom/example2014/components/NumberPicker;->access$1300(Lcom/example2014/components/NumberPicker;)Z

    move-result v0

    if-nez v0, :cond_2

    .line 2126
    iget-object v0, p0, Lcom/example2014/components/NumberPicker$PressedStateHelper;->this$0:Lcom/example2014/components/NumberPicker;

    .line 2127
    invoke-static {}, Landroid/view/ViewConfiguration;->getPressedStateDuration()I

    move-result v1

    int-to-long v3, v1

    .line 2126
    invoke-virtual {v0, p0, v3, v4}, Lcom/example2014/components/NumberPicker;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 2129
    :cond_2
    iget-object v0, p0, Lcom/example2014/components/NumberPicker$PressedStateHelper;->this$0:Lcom/example2014/components/NumberPicker;

    invoke-static {v0, v2}, Lcom/example2014/components/NumberPicker;->access$1380(Lcom/example2014/components/NumberPicker;I)Z

    .line 2130
    iget-object v0, p0, Lcom/example2014/components/NumberPicker$PressedStateHelper;->this$0:Lcom/example2014/components/NumberPicker;

    invoke-virtual {v0}, Lcom/example2014/components/NumberPicker;->invalidate()V

    return-void

    .line 2117
    :cond_3
    iget-object v0, p0, Lcom/example2014/components/NumberPicker$PressedStateHelper;->this$0:Lcom/example2014/components/NumberPicker;

    invoke-static {v0}, Lcom/example2014/components/NumberPicker;->access$1200(Lcom/example2014/components/NumberPicker;)Z

    move-result v0

    if-nez v0, :cond_4

    .line 2118
    iget-object v0, p0, Lcom/example2014/components/NumberPicker$PressedStateHelper;->this$0:Lcom/example2014/components/NumberPicker;

    .line 2119
    invoke-static {}, Landroid/view/ViewConfiguration;->getPressedStateDuration()I

    move-result v1

    int-to-long v3, v1

    .line 2118
    invoke-virtual {v0, p0, v3, v4}, Lcom/example2014/components/NumberPicker;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 2121
    :cond_4
    iget-object v0, p0, Lcom/example2014/components/NumberPicker$PressedStateHelper;->this$0:Lcom/example2014/components/NumberPicker;

    invoke-static {v0, v2}, Lcom/example2014/components/NumberPicker;->access$1280(Lcom/example2014/components/NumberPicker;I)Z

    .line 2122
    iget-object v0, p0, Lcom/example2014/components/NumberPicker$PressedStateHelper;->this$0:Lcom/example2014/components/NumberPicker;

    invoke-virtual {v0}, Lcom/example2014/components/NumberPicker;->invalidate()V

    return-void

    .line 2103
    :cond_5
    iget v0, p0, Lcom/example2014/components/NumberPicker$PressedStateHelper;->mManagedButton:I

    if-eq v0, v2, :cond_7

    if-eq v0, v1, :cond_6

    :goto_0
    return-void

    .line 2109
    :cond_6
    iget-object v0, p0, Lcom/example2014/components/NumberPicker$PressedStateHelper;->this$0:Lcom/example2014/components/NumberPicker;

    invoke-static {v0, v2}, Lcom/example2014/components/NumberPicker;->access$1302(Lcom/example2014/components/NumberPicker;Z)Z

    .line 2110
    iget-object v0, p0, Lcom/example2014/components/NumberPicker$PressedStateHelper;->this$0:Lcom/example2014/components/NumberPicker;

    invoke-virtual {v0}, Lcom/example2014/components/NumberPicker;->invalidate()V

    return-void

    .line 2105
    :cond_7
    iget-object v0, p0, Lcom/example2014/components/NumberPicker$PressedStateHelper;->this$0:Lcom/example2014/components/NumberPicker;

    invoke-static {v0, v2}, Lcom/example2014/components/NumberPicker;->access$1202(Lcom/example2014/components/NumberPicker;Z)Z

    .line 2106
    iget-object v0, p0, Lcom/example2014/components/NumberPicker$PressedStateHelper;->this$0:Lcom/example2014/components/NumberPicker;

    invoke-virtual {v0}, Lcom/example2014/components/NumberPicker;->invalidate()V

    return-void
.end method
