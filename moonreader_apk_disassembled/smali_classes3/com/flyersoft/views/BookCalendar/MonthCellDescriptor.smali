.class public Lcom/flyersoft/views/BookCalendar/MonthCellDescriptor;
.super Ljava/lang/Object;
.source "MonthCellDescriptor.java"


# instance fields
.field private final date:Ljava/util/Date;

.field private final isCurrentMonth:Z

.field private isHighlighted:Z

.field private final isSelectable:Z

.field private isSelected:Z

.field private final isToday:Z

.field private rangeState:Lcom/flyersoft/views/BookCalendar/RangeState;

.field private final value:I


# direct methods
.method constructor <init>(Ljava/util/Date;ZZZZZILcom/flyersoft/views/BookCalendar/RangeState;)V
    .locals 0

    .line 20
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 21
    iput-object p1, p0, Lcom/flyersoft/views/BookCalendar/MonthCellDescriptor;->date:Ljava/util/Date;

    .line 22
    iput-boolean p2, p0, Lcom/flyersoft/views/BookCalendar/MonthCellDescriptor;->isCurrentMonth:Z

    .line 23
    iput-boolean p3, p0, Lcom/flyersoft/views/BookCalendar/MonthCellDescriptor;->isSelectable:Z

    .line 24
    iput-boolean p6, p0, Lcom/flyersoft/views/BookCalendar/MonthCellDescriptor;->isHighlighted:Z

    .line 25
    iput-boolean p4, p0, Lcom/flyersoft/views/BookCalendar/MonthCellDescriptor;->isSelected:Z

    .line 26
    iput-boolean p5, p0, Lcom/flyersoft/views/BookCalendar/MonthCellDescriptor;->isToday:Z

    .line 27
    iput p7, p0, Lcom/flyersoft/views/BookCalendar/MonthCellDescriptor;->value:I

    .line 28
    iput-object p8, p0, Lcom/flyersoft/views/BookCalendar/MonthCellDescriptor;->rangeState:Lcom/flyersoft/views/BookCalendar/RangeState;

    return-void
.end method


# virtual methods
.method public getDate()Ljava/util/Date;
    .locals 1

    .line 32
    iget-object v0, p0, Lcom/flyersoft/views/BookCalendar/MonthCellDescriptor;->date:Ljava/util/Date;

    return-object v0
.end method

.method public getRangeState()Lcom/flyersoft/views/BookCalendar/RangeState;
    .locals 1

    .line 64
    iget-object v0, p0, Lcom/flyersoft/views/BookCalendar/MonthCellDescriptor;->rangeState:Lcom/flyersoft/views/BookCalendar/RangeState;

    return-object v0
.end method

.method public getValue()I
    .locals 1

    .line 72
    iget v0, p0, Lcom/flyersoft/views/BookCalendar/MonthCellDescriptor;->value:I

    return v0
.end method

.method public isCurrentMonth()Z
    .locals 1

    .line 36
    iget-boolean v0, p0, Lcom/flyersoft/views/BookCalendar/MonthCellDescriptor;->isCurrentMonth:Z

    return v0
.end method

.method isHighlighted()Z
    .locals 1

    .line 52
    iget-boolean v0, p0, Lcom/flyersoft/views/BookCalendar/MonthCellDescriptor;->isHighlighted:Z

    return v0
.end method

.method public isSelectable()Z
    .locals 1

    .line 40
    iget-boolean v0, p0, Lcom/flyersoft/views/BookCalendar/MonthCellDescriptor;->isSelectable:Z

    return v0
.end method

.method public isSelected()Z
    .locals 1

    .line 44
    iget-boolean v0, p0, Lcom/flyersoft/views/BookCalendar/MonthCellDescriptor;->isSelected:Z

    return v0
.end method

.method public isToday()Z
    .locals 1

    .line 60
    iget-boolean v0, p0, Lcom/flyersoft/views/BookCalendar/MonthCellDescriptor;->isToday:Z

    return v0
.end method

.method setHighlighted(Z)V
    .locals 0

    .line 56
    iput-boolean p1, p0, Lcom/flyersoft/views/BookCalendar/MonthCellDescriptor;->isHighlighted:Z

    return-void
.end method

.method public setRangeState(Lcom/flyersoft/views/BookCalendar/RangeState;)V
    .locals 0

    .line 68
    iput-object p1, p0, Lcom/flyersoft/views/BookCalendar/MonthCellDescriptor;->rangeState:Lcom/flyersoft/views/BookCalendar/RangeState;

    return-void
.end method

.method public setSelected(Z)V
    .locals 0

    .line 48
    iput-boolean p1, p0, Lcom/flyersoft/views/BookCalendar/MonthCellDescriptor;->isSelected:Z

    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 76
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "MonthCellDescriptor{date="

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Lcom/flyersoft/views/BookCalendar/MonthCellDescriptor;->date:Ljava/util/Date;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ", value="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lcom/flyersoft/views/BookCalendar/MonthCellDescriptor;->value:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, ", isCurrentMonth="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-boolean v1, p0, Lcom/flyersoft/views/BookCalendar/MonthCellDescriptor;->isCurrentMonth:Z

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v1, ", isSelected="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-boolean v1, p0, Lcom/flyersoft/views/BookCalendar/MonthCellDescriptor;->isSelected:Z

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v1, ", isToday="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-boolean v1, p0, Lcom/flyersoft/views/BookCalendar/MonthCellDescriptor;->isToday:Z

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v1, ", isSelectable="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-boolean v1, p0, Lcom/flyersoft/views/BookCalendar/MonthCellDescriptor;->isSelectable:Z

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v1, ", isHighlighted="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-boolean v1, p0, Lcom/flyersoft/views/BookCalendar/MonthCellDescriptor;->isHighlighted:Z

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v1, ", rangeState="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/flyersoft/views/BookCalendar/MonthCellDescriptor;->rangeState:Lcom/flyersoft/views/BookCalendar/RangeState;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const/16 v1, 0x7d

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
