.class public Lcom/vladsch/flexmark/util/html/LengthTrackingAppendableImpl;
.super Ljava/lang/Object;
.source "LengthTrackingAppendableImpl.java"

# interfaces
.implements Lcom/vladsch/flexmark/util/html/LengthTrackingAppendable;


# instance fields
.field private final myAppendable:Ljava/lang/Appendable;

.field private myLength:I


# direct methods
.method public constructor <init>(Ljava/lang/Appendable;)V
    .locals 0

    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 10
    iput-object p1, p0, Lcom/vladsch/flexmark/util/html/LengthTrackingAppendableImpl;->myAppendable:Ljava/lang/Appendable;

    const/4 p1, 0x0

    .line 11
    iput p1, p0, Lcom/vladsch/flexmark/util/html/LengthTrackingAppendableImpl;->myLength:I

    return-void
.end method

.method public static of(Ljava/lang/Appendable;)Lcom/vladsch/flexmark/util/html/LengthTrackingAppendable;
    .locals 1

    .line 45
    new-instance v0, Lcom/vladsch/flexmark/util/html/LengthTrackingAppendableImpl;

    invoke-direct {v0, p0}, Lcom/vladsch/flexmark/util/html/LengthTrackingAppendableImpl;-><init>(Ljava/lang/Appendable;)V

    return-object v0
.end method


# virtual methods
.method public append(C)Lcom/vladsch/flexmark/util/html/LengthTrackingAppendable;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 35
    iget-object v0, p0, Lcom/vladsch/flexmark/util/html/LengthTrackingAppendableImpl;->myAppendable:Ljava/lang/Appendable;

    invoke-interface {v0, p1}, Ljava/lang/Appendable;->append(C)Ljava/lang/Appendable;

    .line 36
    iget p1, p0, Lcom/vladsch/flexmark/util/html/LengthTrackingAppendableImpl;->myLength:I

    add-int/lit8 p1, p1, 0x1

    iput p1, p0, Lcom/vladsch/flexmark/util/html/LengthTrackingAppendableImpl;->myLength:I

    return-object p0
.end method

.method public append(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/html/LengthTrackingAppendable;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 21
    iget-object v0, p0, Lcom/vladsch/flexmark/util/html/LengthTrackingAppendableImpl;->myAppendable:Ljava/lang/Appendable;

    invoke-interface {v0, p1}, Ljava/lang/Appendable;->append(Ljava/lang/CharSequence;)Ljava/lang/Appendable;

    .line 22
    iget v0, p0, Lcom/vladsch/flexmark/util/html/LengthTrackingAppendableImpl;->myLength:I

    invoke-interface {p1}, Ljava/lang/CharSequence;->length()I

    move-result p1

    add-int/2addr v0, p1

    iput v0, p0, Lcom/vladsch/flexmark/util/html/LengthTrackingAppendableImpl;->myLength:I

    return-object p0
.end method

.method public append(Ljava/lang/CharSequence;II)Lcom/vladsch/flexmark/util/html/LengthTrackingAppendable;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 28
    iget-object v0, p0, Lcom/vladsch/flexmark/util/html/LengthTrackingAppendableImpl;->myAppendable:Ljava/lang/Appendable;

    invoke-interface {v0, p1, p2, p3}, Ljava/lang/Appendable;->append(Ljava/lang/CharSequence;II)Ljava/lang/Appendable;

    .line 29
    iget p1, p0, Lcom/vladsch/flexmark/util/html/LengthTrackingAppendableImpl;->myLength:I

    sub-int/2addr p3, p2

    add-int/2addr p1, p3

    iput p1, p0, Lcom/vladsch/flexmark/util/html/LengthTrackingAppendableImpl;->myLength:I

    return-object p0
.end method

.method public bridge synthetic append(C)Ljava/lang/Appendable;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 5
    invoke-virtual {p0, p1}, Lcom/vladsch/flexmark/util/html/LengthTrackingAppendableImpl;->append(C)Lcom/vladsch/flexmark/util/html/LengthTrackingAppendable;

    move-result-object p1

    return-object p1
.end method

.method public bridge synthetic append(Ljava/lang/CharSequence;)Ljava/lang/Appendable;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 5
    invoke-virtual {p0, p1}, Lcom/vladsch/flexmark/util/html/LengthTrackingAppendableImpl;->append(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/html/LengthTrackingAppendable;

    move-result-object p1

    return-object p1
.end method

.method public bridge synthetic append(Ljava/lang/CharSequence;II)Ljava/lang/Appendable;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 5
    invoke-virtual {p0, p1, p2, p3}, Lcom/vladsch/flexmark/util/html/LengthTrackingAppendableImpl;->append(Ljava/lang/CharSequence;II)Lcom/vladsch/flexmark/util/html/LengthTrackingAppendable;

    move-result-object p1

    return-object p1
.end method

.method public getAppendable()Ljava/lang/Appendable;
    .locals 1

    .line 41
    iget-object v0, p0, Lcom/vladsch/flexmark/util/html/LengthTrackingAppendableImpl;->myAppendable:Ljava/lang/Appendable;

    return-object v0
.end method

.method public getLength()I
    .locals 1

    .line 16
    iget v0, p0, Lcom/vladsch/flexmark/util/html/LengthTrackingAppendableImpl;->myLength:I

    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 1

    .line 50
    iget-object v0, p0, Lcom/vladsch/flexmark/util/html/LengthTrackingAppendableImpl;->myAppendable:Ljava/lang/Appendable;

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
