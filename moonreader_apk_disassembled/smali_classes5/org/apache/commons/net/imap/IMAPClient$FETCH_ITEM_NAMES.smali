.class public final enum Lorg/apache/commons/net/imap/IMAPClient$FETCH_ITEM_NAMES;
.super Ljava/lang/Enum;
.source "IMAPClient.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/apache/commons/net/imap/IMAPClient;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "FETCH_ITEM_NAMES"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lorg/apache/commons/net/imap/IMAPClient$FETCH_ITEM_NAMES;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lorg/apache/commons/net/imap/IMAPClient$FETCH_ITEM_NAMES;

.field public static final enum ALL:Lorg/apache/commons/net/imap/IMAPClient$FETCH_ITEM_NAMES;

.field public static final enum BODY:Lorg/apache/commons/net/imap/IMAPClient$FETCH_ITEM_NAMES;

.field public static final enum BODYSTRUCTURE:Lorg/apache/commons/net/imap/IMAPClient$FETCH_ITEM_NAMES;

.field public static final enum ENVELOPE:Lorg/apache/commons/net/imap/IMAPClient$FETCH_ITEM_NAMES;

.field public static final enum FAST:Lorg/apache/commons/net/imap/IMAPClient$FETCH_ITEM_NAMES;

.field public static final enum FLAGS:Lorg/apache/commons/net/imap/IMAPClient$FETCH_ITEM_NAMES;

.field public static final enum FULL:Lorg/apache/commons/net/imap/IMAPClient$FETCH_ITEM_NAMES;

.field public static final enum INTERNALDATE:Lorg/apache/commons/net/imap/IMAPClient$FETCH_ITEM_NAMES;

.field public static final enum RFC822:Lorg/apache/commons/net/imap/IMAPClient$FETCH_ITEM_NAMES;

.field public static final enum UID:Lorg/apache/commons/net/imap/IMAPClient$FETCH_ITEM_NAMES;


# direct methods
.method static constructor <clinit>()V
    .locals 21

    .line 597
    new-instance v0, Lorg/apache/commons/net/imap/IMAPClient$FETCH_ITEM_NAMES;

    const-string v1, "ALL"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lorg/apache/commons/net/imap/IMAPClient$FETCH_ITEM_NAMES;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/apache/commons/net/imap/IMAPClient$FETCH_ITEM_NAMES;->ALL:Lorg/apache/commons/net/imap/IMAPClient$FETCH_ITEM_NAMES;

    .line 599
    new-instance v1, Lorg/apache/commons/net/imap/IMAPClient$FETCH_ITEM_NAMES;

    const-string v3, "FAST"

    const/4 v4, 0x1

    invoke-direct {v1, v3, v4}, Lorg/apache/commons/net/imap/IMAPClient$FETCH_ITEM_NAMES;-><init>(Ljava/lang/String;I)V

    sput-object v1, Lorg/apache/commons/net/imap/IMAPClient$FETCH_ITEM_NAMES;->FAST:Lorg/apache/commons/net/imap/IMAPClient$FETCH_ITEM_NAMES;

    .line 601
    new-instance v3, Lorg/apache/commons/net/imap/IMAPClient$FETCH_ITEM_NAMES;

    const-string v5, "FULL"

    const/4 v6, 0x2

    invoke-direct {v3, v5, v6}, Lorg/apache/commons/net/imap/IMAPClient$FETCH_ITEM_NAMES;-><init>(Ljava/lang/String;I)V

    sput-object v3, Lorg/apache/commons/net/imap/IMAPClient$FETCH_ITEM_NAMES;->FULL:Lorg/apache/commons/net/imap/IMAPClient$FETCH_ITEM_NAMES;

    .line 603
    new-instance v5, Lorg/apache/commons/net/imap/IMAPClient$FETCH_ITEM_NAMES;

    const-string v7, "BODY"

    const/4 v8, 0x3

    invoke-direct {v5, v7, v8}, Lorg/apache/commons/net/imap/IMAPClient$FETCH_ITEM_NAMES;-><init>(Ljava/lang/String;I)V

    sput-object v5, Lorg/apache/commons/net/imap/IMAPClient$FETCH_ITEM_NAMES;->BODY:Lorg/apache/commons/net/imap/IMAPClient$FETCH_ITEM_NAMES;

    .line 605
    new-instance v7, Lorg/apache/commons/net/imap/IMAPClient$FETCH_ITEM_NAMES;

    const-string v9, "BODYSTRUCTURE"

    const/4 v10, 0x4

    invoke-direct {v7, v9, v10}, Lorg/apache/commons/net/imap/IMAPClient$FETCH_ITEM_NAMES;-><init>(Ljava/lang/String;I)V

    sput-object v7, Lorg/apache/commons/net/imap/IMAPClient$FETCH_ITEM_NAMES;->BODYSTRUCTURE:Lorg/apache/commons/net/imap/IMAPClient$FETCH_ITEM_NAMES;

    .line 607
    new-instance v9, Lorg/apache/commons/net/imap/IMAPClient$FETCH_ITEM_NAMES;

    const-string v11, "ENVELOPE"

    const/4 v12, 0x5

    invoke-direct {v9, v11, v12}, Lorg/apache/commons/net/imap/IMAPClient$FETCH_ITEM_NAMES;-><init>(Ljava/lang/String;I)V

    sput-object v9, Lorg/apache/commons/net/imap/IMAPClient$FETCH_ITEM_NAMES;->ENVELOPE:Lorg/apache/commons/net/imap/IMAPClient$FETCH_ITEM_NAMES;

    .line 609
    new-instance v11, Lorg/apache/commons/net/imap/IMAPClient$FETCH_ITEM_NAMES;

    const-string v13, "FLAGS"

    const/4 v14, 0x6

    invoke-direct {v11, v13, v14}, Lorg/apache/commons/net/imap/IMAPClient$FETCH_ITEM_NAMES;-><init>(Ljava/lang/String;I)V

    sput-object v11, Lorg/apache/commons/net/imap/IMAPClient$FETCH_ITEM_NAMES;->FLAGS:Lorg/apache/commons/net/imap/IMAPClient$FETCH_ITEM_NAMES;

    .line 611
    new-instance v13, Lorg/apache/commons/net/imap/IMAPClient$FETCH_ITEM_NAMES;

    const-string v15, "INTERNALDATE"

    const/16 v16, 0x0

    const/4 v2, 0x7

    invoke-direct {v13, v15, v2}, Lorg/apache/commons/net/imap/IMAPClient$FETCH_ITEM_NAMES;-><init>(Ljava/lang/String;I)V

    sput-object v13, Lorg/apache/commons/net/imap/IMAPClient$FETCH_ITEM_NAMES;->INTERNALDATE:Lorg/apache/commons/net/imap/IMAPClient$FETCH_ITEM_NAMES;

    .line 613
    new-instance v15, Lorg/apache/commons/net/imap/IMAPClient$FETCH_ITEM_NAMES;

    const/16 v17, 0x7

    const-string v2, "RFC822"

    const/16 v18, 0x1

    const/16 v4, 0x8

    invoke-direct {v15, v2, v4}, Lorg/apache/commons/net/imap/IMAPClient$FETCH_ITEM_NAMES;-><init>(Ljava/lang/String;I)V

    sput-object v15, Lorg/apache/commons/net/imap/IMAPClient$FETCH_ITEM_NAMES;->RFC822:Lorg/apache/commons/net/imap/IMAPClient$FETCH_ITEM_NAMES;

    .line 615
    new-instance v2, Lorg/apache/commons/net/imap/IMAPClient$FETCH_ITEM_NAMES;

    const/16 v19, 0x8

    const-string v4, "UID"

    const/16 v20, 0x2

    const/16 v6, 0x9

    invoke-direct {v2, v4, v6}, Lorg/apache/commons/net/imap/IMAPClient$FETCH_ITEM_NAMES;-><init>(Ljava/lang/String;I)V

    sput-object v2, Lorg/apache/commons/net/imap/IMAPClient$FETCH_ITEM_NAMES;->UID:Lorg/apache/commons/net/imap/IMAPClient$FETCH_ITEM_NAMES;

    const/16 v4, 0xa

    .line 594
    new-array v4, v4, [Lorg/apache/commons/net/imap/IMAPClient$FETCH_ITEM_NAMES;

    aput-object v0, v4, v16

    aput-object v1, v4, v18

    aput-object v3, v4, v20

    aput-object v5, v4, v8

    aput-object v7, v4, v10

    aput-object v9, v4, v12

    aput-object v11, v4, v14

    aput-object v13, v4, v17

    aput-object v15, v4, v19

    aput-object v2, v4, v6

    sput-object v4, Lorg/apache/commons/net/imap/IMAPClient$FETCH_ITEM_NAMES;->$VALUES:[Lorg/apache/commons/net/imap/IMAPClient$FETCH_ITEM_NAMES;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 594
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lorg/apache/commons/net/imap/IMAPClient$FETCH_ITEM_NAMES;
    .locals 1

    .line 594
    const-class v0, Lorg/apache/commons/net/imap/IMAPClient$FETCH_ITEM_NAMES;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lorg/apache/commons/net/imap/IMAPClient$FETCH_ITEM_NAMES;

    return-object p0
.end method

.method public static values()[Lorg/apache/commons/net/imap/IMAPClient$FETCH_ITEM_NAMES;
    .locals 1

    .line 594
    sget-object v0, Lorg/apache/commons/net/imap/IMAPClient$FETCH_ITEM_NAMES;->$VALUES:[Lorg/apache/commons/net/imap/IMAPClient$FETCH_ITEM_NAMES;

    invoke-virtual {v0}, [Lorg/apache/commons/net/imap/IMAPClient$FETCH_ITEM_NAMES;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lorg/apache/commons/net/imap/IMAPClient$FETCH_ITEM_NAMES;

    return-object v0
.end method
