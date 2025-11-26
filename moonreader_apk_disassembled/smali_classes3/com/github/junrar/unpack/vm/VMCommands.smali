.class public final enum Lcom/github/junrar/unpack/vm/VMCommands;
.super Ljava/lang/Enum;
.source "VMCommands.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/github/junrar/unpack/vm/VMCommands;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/github/junrar/unpack/vm/VMCommands;

.field public static final enum VM_ADC:Lcom/github/junrar/unpack/vm/VMCommands;

.field public static final enum VM_ADD:Lcom/github/junrar/unpack/vm/VMCommands;

.field public static final enum VM_ADDB:Lcom/github/junrar/unpack/vm/VMCommands;

.field public static final enum VM_ADDD:Lcom/github/junrar/unpack/vm/VMCommands;

.field public static final enum VM_AND:Lcom/github/junrar/unpack/vm/VMCommands;

.field public static final enum VM_CALL:Lcom/github/junrar/unpack/vm/VMCommands;

.field public static final enum VM_CMP:Lcom/github/junrar/unpack/vm/VMCommands;

.field public static final enum VM_CMPB:Lcom/github/junrar/unpack/vm/VMCommands;

.field public static final enum VM_CMPD:Lcom/github/junrar/unpack/vm/VMCommands;

.field public static final enum VM_DEC:Lcom/github/junrar/unpack/vm/VMCommands;

.field public static final enum VM_DECB:Lcom/github/junrar/unpack/vm/VMCommands;

.field public static final enum VM_DECD:Lcom/github/junrar/unpack/vm/VMCommands;

.field public static final enum VM_DIV:Lcom/github/junrar/unpack/vm/VMCommands;

.field public static final enum VM_INC:Lcom/github/junrar/unpack/vm/VMCommands;

.field public static final enum VM_INCB:Lcom/github/junrar/unpack/vm/VMCommands;

.field public static final enum VM_INCD:Lcom/github/junrar/unpack/vm/VMCommands;

.field public static final enum VM_JA:Lcom/github/junrar/unpack/vm/VMCommands;

.field public static final enum VM_JAE:Lcom/github/junrar/unpack/vm/VMCommands;

.field public static final enum VM_JB:Lcom/github/junrar/unpack/vm/VMCommands;

.field public static final enum VM_JBE:Lcom/github/junrar/unpack/vm/VMCommands;

.field public static final enum VM_JMP:Lcom/github/junrar/unpack/vm/VMCommands;

.field public static final enum VM_JNS:Lcom/github/junrar/unpack/vm/VMCommands;

.field public static final enum VM_JNZ:Lcom/github/junrar/unpack/vm/VMCommands;

.field public static final enum VM_JS:Lcom/github/junrar/unpack/vm/VMCommands;

.field public static final enum VM_JZ:Lcom/github/junrar/unpack/vm/VMCommands;

.field public static final enum VM_MOV:Lcom/github/junrar/unpack/vm/VMCommands;

.field public static final enum VM_MOVB:Lcom/github/junrar/unpack/vm/VMCommands;

.field public static final enum VM_MOVD:Lcom/github/junrar/unpack/vm/VMCommands;

.field public static final enum VM_MOVSX:Lcom/github/junrar/unpack/vm/VMCommands;

.field public static final enum VM_MOVZX:Lcom/github/junrar/unpack/vm/VMCommands;

.field public static final enum VM_MUL:Lcom/github/junrar/unpack/vm/VMCommands;

.field public static final enum VM_NEG:Lcom/github/junrar/unpack/vm/VMCommands;

.field public static final enum VM_NEGB:Lcom/github/junrar/unpack/vm/VMCommands;

.field public static final enum VM_NEGD:Lcom/github/junrar/unpack/vm/VMCommands;

.field public static final enum VM_NOT:Lcom/github/junrar/unpack/vm/VMCommands;

.field public static final enum VM_OR:Lcom/github/junrar/unpack/vm/VMCommands;

.field public static final enum VM_POP:Lcom/github/junrar/unpack/vm/VMCommands;

.field public static final enum VM_POPA:Lcom/github/junrar/unpack/vm/VMCommands;

.field public static final enum VM_POPF:Lcom/github/junrar/unpack/vm/VMCommands;

.field public static final enum VM_PRINT:Lcom/github/junrar/unpack/vm/VMCommands;

.field public static final enum VM_PUSH:Lcom/github/junrar/unpack/vm/VMCommands;

.field public static final enum VM_PUSHA:Lcom/github/junrar/unpack/vm/VMCommands;

.field public static final enum VM_PUSHF:Lcom/github/junrar/unpack/vm/VMCommands;

.field public static final enum VM_RET:Lcom/github/junrar/unpack/vm/VMCommands;

.field public static final enum VM_SAR:Lcom/github/junrar/unpack/vm/VMCommands;

.field public static final enum VM_SBB:Lcom/github/junrar/unpack/vm/VMCommands;

.field public static final enum VM_SHL:Lcom/github/junrar/unpack/vm/VMCommands;

.field public static final enum VM_SHR:Lcom/github/junrar/unpack/vm/VMCommands;

.field public static final enum VM_STANDARD:Lcom/github/junrar/unpack/vm/VMCommands;

.field public static final enum VM_SUB:Lcom/github/junrar/unpack/vm/VMCommands;

.field public static final enum VM_SUBB:Lcom/github/junrar/unpack/vm/VMCommands;

.field public static final enum VM_SUBD:Lcom/github/junrar/unpack/vm/VMCommands;

.field public static final enum VM_TEST:Lcom/github/junrar/unpack/vm/VMCommands;

.field public static final enum VM_XCHG:Lcom/github/junrar/unpack/vm/VMCommands;

.field public static final enum VM_XOR:Lcom/github/junrar/unpack/vm/VMCommands;


# instance fields
.field private vmCommand:I


# direct methods
.method static constructor <clinit>()V
    .locals 80

    .line 27
    new-instance v0, Lcom/github/junrar/unpack/vm/VMCommands;

    const-string v1, "VM_MOV"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2, v2}, Lcom/github/junrar/unpack/vm/VMCommands;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/github/junrar/unpack/vm/VMCommands;->VM_MOV:Lcom/github/junrar/unpack/vm/VMCommands;

    new-instance v1, Lcom/github/junrar/unpack/vm/VMCommands;

    const-string v3, "VM_CMP"

    const/4 v4, 0x1

    invoke-direct {v1, v3, v4, v4}, Lcom/github/junrar/unpack/vm/VMCommands;-><init>(Ljava/lang/String;II)V

    sput-object v1, Lcom/github/junrar/unpack/vm/VMCommands;->VM_CMP:Lcom/github/junrar/unpack/vm/VMCommands;

    new-instance v3, Lcom/github/junrar/unpack/vm/VMCommands;

    const-string v5, "VM_ADD"

    const/4 v6, 0x2

    invoke-direct {v3, v5, v6, v6}, Lcom/github/junrar/unpack/vm/VMCommands;-><init>(Ljava/lang/String;II)V

    sput-object v3, Lcom/github/junrar/unpack/vm/VMCommands;->VM_ADD:Lcom/github/junrar/unpack/vm/VMCommands;

    new-instance v5, Lcom/github/junrar/unpack/vm/VMCommands;

    const-string v7, "VM_SUB"

    const/4 v8, 0x3

    invoke-direct {v5, v7, v8, v8}, Lcom/github/junrar/unpack/vm/VMCommands;-><init>(Ljava/lang/String;II)V

    sput-object v5, Lcom/github/junrar/unpack/vm/VMCommands;->VM_SUB:Lcom/github/junrar/unpack/vm/VMCommands;

    new-instance v7, Lcom/github/junrar/unpack/vm/VMCommands;

    const-string v9, "VM_JZ"

    const/4 v10, 0x4

    invoke-direct {v7, v9, v10, v10}, Lcom/github/junrar/unpack/vm/VMCommands;-><init>(Ljava/lang/String;II)V

    sput-object v7, Lcom/github/junrar/unpack/vm/VMCommands;->VM_JZ:Lcom/github/junrar/unpack/vm/VMCommands;

    new-instance v9, Lcom/github/junrar/unpack/vm/VMCommands;

    const-string v11, "VM_JNZ"

    const/4 v12, 0x5

    invoke-direct {v9, v11, v12, v12}, Lcom/github/junrar/unpack/vm/VMCommands;-><init>(Ljava/lang/String;II)V

    sput-object v9, Lcom/github/junrar/unpack/vm/VMCommands;->VM_JNZ:Lcom/github/junrar/unpack/vm/VMCommands;

    new-instance v11, Lcom/github/junrar/unpack/vm/VMCommands;

    const-string v13, "VM_INC"

    const/4 v14, 0x6

    invoke-direct {v11, v13, v14, v14}, Lcom/github/junrar/unpack/vm/VMCommands;-><init>(Ljava/lang/String;II)V

    sput-object v11, Lcom/github/junrar/unpack/vm/VMCommands;->VM_INC:Lcom/github/junrar/unpack/vm/VMCommands;

    new-instance v13, Lcom/github/junrar/unpack/vm/VMCommands;

    const-string v15, "VM_DEC"

    const/16 v16, 0x0

    const/4 v2, 0x7

    invoke-direct {v13, v15, v2, v2}, Lcom/github/junrar/unpack/vm/VMCommands;-><init>(Ljava/lang/String;II)V

    sput-object v13, Lcom/github/junrar/unpack/vm/VMCommands;->VM_DEC:Lcom/github/junrar/unpack/vm/VMCommands;

    .line 28
    new-instance v15, Lcom/github/junrar/unpack/vm/VMCommands;

    const/16 v17, 0x7

    const-string v2, "VM_JMP"

    const/16 v18, 0x1

    const/16 v4, 0x8

    invoke-direct {v15, v2, v4, v4}, Lcom/github/junrar/unpack/vm/VMCommands;-><init>(Ljava/lang/String;II)V

    sput-object v15, Lcom/github/junrar/unpack/vm/VMCommands;->VM_JMP:Lcom/github/junrar/unpack/vm/VMCommands;

    new-instance v2, Lcom/github/junrar/unpack/vm/VMCommands;

    const/16 v19, 0x8

    const-string v4, "VM_XOR"

    const/16 v20, 0x2

    const/16 v6, 0x9

    invoke-direct {v2, v4, v6, v6}, Lcom/github/junrar/unpack/vm/VMCommands;-><init>(Ljava/lang/String;II)V

    sput-object v2, Lcom/github/junrar/unpack/vm/VMCommands;->VM_XOR:Lcom/github/junrar/unpack/vm/VMCommands;

    new-instance v4, Lcom/github/junrar/unpack/vm/VMCommands;

    const/16 v21, 0x9

    const-string v6, "VM_AND"

    const/16 v22, 0x3

    const/16 v8, 0xa

    invoke-direct {v4, v6, v8, v8}, Lcom/github/junrar/unpack/vm/VMCommands;-><init>(Ljava/lang/String;II)V

    sput-object v4, Lcom/github/junrar/unpack/vm/VMCommands;->VM_AND:Lcom/github/junrar/unpack/vm/VMCommands;

    new-instance v6, Lcom/github/junrar/unpack/vm/VMCommands;

    const/16 v23, 0xa

    const-string v8, "VM_OR"

    const/16 v24, 0x4

    const/16 v10, 0xb

    invoke-direct {v6, v8, v10, v10}, Lcom/github/junrar/unpack/vm/VMCommands;-><init>(Ljava/lang/String;II)V

    sput-object v6, Lcom/github/junrar/unpack/vm/VMCommands;->VM_OR:Lcom/github/junrar/unpack/vm/VMCommands;

    new-instance v8, Lcom/github/junrar/unpack/vm/VMCommands;

    const/16 v25, 0xb

    const-string v10, "VM_TEST"

    const/16 v26, 0x5

    const/16 v12, 0xc

    invoke-direct {v8, v10, v12, v12}, Lcom/github/junrar/unpack/vm/VMCommands;-><init>(Ljava/lang/String;II)V

    sput-object v8, Lcom/github/junrar/unpack/vm/VMCommands;->VM_TEST:Lcom/github/junrar/unpack/vm/VMCommands;

    new-instance v10, Lcom/github/junrar/unpack/vm/VMCommands;

    const/16 v27, 0xc

    const-string v12, "VM_JS"

    const/16 v28, 0x6

    const/16 v14, 0xd

    invoke-direct {v10, v12, v14, v14}, Lcom/github/junrar/unpack/vm/VMCommands;-><init>(Ljava/lang/String;II)V

    sput-object v10, Lcom/github/junrar/unpack/vm/VMCommands;->VM_JS:Lcom/github/junrar/unpack/vm/VMCommands;

    .line 29
    new-instance v12, Lcom/github/junrar/unpack/vm/VMCommands;

    const/16 v29, 0xd

    const-string v14, "VM_JNS"

    move-object/from16 v30, v0

    const/16 v0, 0xe

    invoke-direct {v12, v14, v0, v0}, Lcom/github/junrar/unpack/vm/VMCommands;-><init>(Ljava/lang/String;II)V

    sput-object v12, Lcom/github/junrar/unpack/vm/VMCommands;->VM_JNS:Lcom/github/junrar/unpack/vm/VMCommands;

    new-instance v14, Lcom/github/junrar/unpack/vm/VMCommands;

    const/16 v31, 0xe

    const-string v0, "VM_JB"

    move-object/from16 v32, v1

    const/16 v1, 0xf

    invoke-direct {v14, v0, v1, v1}, Lcom/github/junrar/unpack/vm/VMCommands;-><init>(Ljava/lang/String;II)V

    sput-object v14, Lcom/github/junrar/unpack/vm/VMCommands;->VM_JB:Lcom/github/junrar/unpack/vm/VMCommands;

    new-instance v0, Lcom/github/junrar/unpack/vm/VMCommands;

    const/16 v33, 0xf

    const-string v1, "VM_JBE"

    move-object/from16 v34, v2

    const/16 v2, 0x10

    invoke-direct {v0, v1, v2, v2}, Lcom/github/junrar/unpack/vm/VMCommands;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/github/junrar/unpack/vm/VMCommands;->VM_JBE:Lcom/github/junrar/unpack/vm/VMCommands;

    new-instance v1, Lcom/github/junrar/unpack/vm/VMCommands;

    const/16 v35, 0x10

    const-string v2, "VM_JA"

    move-object/from16 v36, v0

    const/16 v0, 0x11

    invoke-direct {v1, v2, v0, v0}, Lcom/github/junrar/unpack/vm/VMCommands;-><init>(Ljava/lang/String;II)V

    sput-object v1, Lcom/github/junrar/unpack/vm/VMCommands;->VM_JA:Lcom/github/junrar/unpack/vm/VMCommands;

    new-instance v2, Lcom/github/junrar/unpack/vm/VMCommands;

    const/16 v37, 0x11

    const-string v0, "VM_JAE"

    move-object/from16 v38, v1

    const/16 v1, 0x12

    invoke-direct {v2, v0, v1, v1}, Lcom/github/junrar/unpack/vm/VMCommands;-><init>(Ljava/lang/String;II)V

    sput-object v2, Lcom/github/junrar/unpack/vm/VMCommands;->VM_JAE:Lcom/github/junrar/unpack/vm/VMCommands;

    new-instance v0, Lcom/github/junrar/unpack/vm/VMCommands;

    const/16 v39, 0x12

    const-string v1, "VM_PUSH"

    move-object/from16 v40, v2

    const/16 v2, 0x13

    invoke-direct {v0, v1, v2, v2}, Lcom/github/junrar/unpack/vm/VMCommands;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/github/junrar/unpack/vm/VMCommands;->VM_PUSH:Lcom/github/junrar/unpack/vm/VMCommands;

    .line 30
    new-instance v1, Lcom/github/junrar/unpack/vm/VMCommands;

    const/16 v41, 0x13

    const-string v2, "VM_POP"

    move-object/from16 v42, v0

    const/16 v0, 0x14

    invoke-direct {v1, v2, v0, v0}, Lcom/github/junrar/unpack/vm/VMCommands;-><init>(Ljava/lang/String;II)V

    sput-object v1, Lcom/github/junrar/unpack/vm/VMCommands;->VM_POP:Lcom/github/junrar/unpack/vm/VMCommands;

    new-instance v2, Lcom/github/junrar/unpack/vm/VMCommands;

    const/16 v43, 0x14

    const-string v0, "VM_CALL"

    move-object/from16 v44, v1

    const/16 v1, 0x15

    invoke-direct {v2, v0, v1, v1}, Lcom/github/junrar/unpack/vm/VMCommands;-><init>(Ljava/lang/String;II)V

    sput-object v2, Lcom/github/junrar/unpack/vm/VMCommands;->VM_CALL:Lcom/github/junrar/unpack/vm/VMCommands;

    new-instance v0, Lcom/github/junrar/unpack/vm/VMCommands;

    const/16 v45, 0x15

    const/16 v1, 0x16

    move-object/from16 v46, v2

    const/16 v2, 0x16

    move-object/from16 v47, v3

    const-string v3, "VM_RET"

    invoke-direct {v0, v3, v1, v2}, Lcom/github/junrar/unpack/vm/VMCommands;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/github/junrar/unpack/vm/VMCommands;->VM_RET:Lcom/github/junrar/unpack/vm/VMCommands;

    new-instance v1, Lcom/github/junrar/unpack/vm/VMCommands;

    const/16 v2, 0x17

    const/16 v3, 0x17

    move-object/from16 v48, v0

    const-string v0, "VM_NOT"

    invoke-direct {v1, v0, v2, v3}, Lcom/github/junrar/unpack/vm/VMCommands;-><init>(Ljava/lang/String;II)V

    sput-object v1, Lcom/github/junrar/unpack/vm/VMCommands;->VM_NOT:Lcom/github/junrar/unpack/vm/VMCommands;

    new-instance v0, Lcom/github/junrar/unpack/vm/VMCommands;

    const/16 v2, 0x18

    const/16 v3, 0x18

    move-object/from16 v49, v1

    const-string v1, "VM_SHL"

    invoke-direct {v0, v1, v2, v3}, Lcom/github/junrar/unpack/vm/VMCommands;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/github/junrar/unpack/vm/VMCommands;->VM_SHL:Lcom/github/junrar/unpack/vm/VMCommands;

    new-instance v1, Lcom/github/junrar/unpack/vm/VMCommands;

    const/16 v2, 0x19

    const/16 v3, 0x19

    move-object/from16 v50, v0

    const-string v0, "VM_SHR"

    invoke-direct {v1, v0, v2, v3}, Lcom/github/junrar/unpack/vm/VMCommands;-><init>(Ljava/lang/String;II)V

    sput-object v1, Lcom/github/junrar/unpack/vm/VMCommands;->VM_SHR:Lcom/github/junrar/unpack/vm/VMCommands;

    .line 31
    new-instance v0, Lcom/github/junrar/unpack/vm/VMCommands;

    const/16 v2, 0x1a

    const/16 v3, 0x1a

    move-object/from16 v51, v1

    const-string v1, "VM_SAR"

    invoke-direct {v0, v1, v2, v3}, Lcom/github/junrar/unpack/vm/VMCommands;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/github/junrar/unpack/vm/VMCommands;->VM_SAR:Lcom/github/junrar/unpack/vm/VMCommands;

    new-instance v1, Lcom/github/junrar/unpack/vm/VMCommands;

    const/16 v2, 0x1b

    const/16 v3, 0x1b

    move-object/from16 v52, v0

    const-string v0, "VM_NEG"

    invoke-direct {v1, v0, v2, v3}, Lcom/github/junrar/unpack/vm/VMCommands;-><init>(Ljava/lang/String;II)V

    sput-object v1, Lcom/github/junrar/unpack/vm/VMCommands;->VM_NEG:Lcom/github/junrar/unpack/vm/VMCommands;

    new-instance v0, Lcom/github/junrar/unpack/vm/VMCommands;

    const/16 v2, 0x1c

    const/16 v3, 0x1c

    move-object/from16 v53, v1

    const-string v1, "VM_PUSHA"

    invoke-direct {v0, v1, v2, v3}, Lcom/github/junrar/unpack/vm/VMCommands;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/github/junrar/unpack/vm/VMCommands;->VM_PUSHA:Lcom/github/junrar/unpack/vm/VMCommands;

    new-instance v1, Lcom/github/junrar/unpack/vm/VMCommands;

    const/16 v2, 0x1d

    const/16 v3, 0x1d

    move-object/from16 v54, v0

    const-string v0, "VM_POPA"

    invoke-direct {v1, v0, v2, v3}, Lcom/github/junrar/unpack/vm/VMCommands;-><init>(Ljava/lang/String;II)V

    sput-object v1, Lcom/github/junrar/unpack/vm/VMCommands;->VM_POPA:Lcom/github/junrar/unpack/vm/VMCommands;

    new-instance v0, Lcom/github/junrar/unpack/vm/VMCommands;

    const/16 v2, 0x1e

    const/16 v3, 0x1e

    move-object/from16 v55, v1

    const-string v1, "VM_PUSHF"

    invoke-direct {v0, v1, v2, v3}, Lcom/github/junrar/unpack/vm/VMCommands;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/github/junrar/unpack/vm/VMCommands;->VM_PUSHF:Lcom/github/junrar/unpack/vm/VMCommands;

    new-instance v1, Lcom/github/junrar/unpack/vm/VMCommands;

    const/16 v2, 0x1f

    const/16 v3, 0x1f

    move-object/from16 v56, v0

    const-string v0, "VM_POPF"

    invoke-direct {v1, v0, v2, v3}, Lcom/github/junrar/unpack/vm/VMCommands;-><init>(Ljava/lang/String;II)V

    sput-object v1, Lcom/github/junrar/unpack/vm/VMCommands;->VM_POPF:Lcom/github/junrar/unpack/vm/VMCommands;

    .line 32
    new-instance v0, Lcom/github/junrar/unpack/vm/VMCommands;

    const/16 v2, 0x20

    const/16 v3, 0x20

    move-object/from16 v57, v1

    const-string v1, "VM_MOVZX"

    invoke-direct {v0, v1, v2, v3}, Lcom/github/junrar/unpack/vm/VMCommands;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/github/junrar/unpack/vm/VMCommands;->VM_MOVZX:Lcom/github/junrar/unpack/vm/VMCommands;

    new-instance v1, Lcom/github/junrar/unpack/vm/VMCommands;

    const/16 v2, 0x21

    const/16 v3, 0x21

    move-object/from16 v58, v0

    const-string v0, "VM_MOVSX"

    invoke-direct {v1, v0, v2, v3}, Lcom/github/junrar/unpack/vm/VMCommands;-><init>(Ljava/lang/String;II)V

    sput-object v1, Lcom/github/junrar/unpack/vm/VMCommands;->VM_MOVSX:Lcom/github/junrar/unpack/vm/VMCommands;

    new-instance v0, Lcom/github/junrar/unpack/vm/VMCommands;

    const/16 v2, 0x22

    const/16 v3, 0x22

    move-object/from16 v59, v1

    const-string v1, "VM_XCHG"

    invoke-direct {v0, v1, v2, v3}, Lcom/github/junrar/unpack/vm/VMCommands;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/github/junrar/unpack/vm/VMCommands;->VM_XCHG:Lcom/github/junrar/unpack/vm/VMCommands;

    new-instance v1, Lcom/github/junrar/unpack/vm/VMCommands;

    const/16 v2, 0x23

    const/16 v3, 0x23

    move-object/from16 v60, v0

    const-string v0, "VM_MUL"

    invoke-direct {v1, v0, v2, v3}, Lcom/github/junrar/unpack/vm/VMCommands;-><init>(Ljava/lang/String;II)V

    sput-object v1, Lcom/github/junrar/unpack/vm/VMCommands;->VM_MUL:Lcom/github/junrar/unpack/vm/VMCommands;

    new-instance v0, Lcom/github/junrar/unpack/vm/VMCommands;

    const/16 v2, 0x24

    const/16 v3, 0x24

    move-object/from16 v61, v1

    const-string v1, "VM_DIV"

    invoke-direct {v0, v1, v2, v3}, Lcom/github/junrar/unpack/vm/VMCommands;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/github/junrar/unpack/vm/VMCommands;->VM_DIV:Lcom/github/junrar/unpack/vm/VMCommands;

    new-instance v1, Lcom/github/junrar/unpack/vm/VMCommands;

    const/16 v2, 0x25

    const/16 v3, 0x25

    move-object/from16 v62, v0

    const-string v0, "VM_ADC"

    invoke-direct {v1, v0, v2, v3}, Lcom/github/junrar/unpack/vm/VMCommands;-><init>(Ljava/lang/String;II)V

    sput-object v1, Lcom/github/junrar/unpack/vm/VMCommands;->VM_ADC:Lcom/github/junrar/unpack/vm/VMCommands;

    .line 33
    new-instance v0, Lcom/github/junrar/unpack/vm/VMCommands;

    const/16 v2, 0x26

    const/16 v3, 0x26

    move-object/from16 v63, v1

    const-string v1, "VM_SBB"

    invoke-direct {v0, v1, v2, v3}, Lcom/github/junrar/unpack/vm/VMCommands;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/github/junrar/unpack/vm/VMCommands;->VM_SBB:Lcom/github/junrar/unpack/vm/VMCommands;

    new-instance v1, Lcom/github/junrar/unpack/vm/VMCommands;

    const/16 v2, 0x27

    const/16 v3, 0x27

    move-object/from16 v64, v0

    const-string v0, "VM_PRINT"

    invoke-direct {v1, v0, v2, v3}, Lcom/github/junrar/unpack/vm/VMCommands;-><init>(Ljava/lang/String;II)V

    sput-object v1, Lcom/github/junrar/unpack/vm/VMCommands;->VM_PRINT:Lcom/github/junrar/unpack/vm/VMCommands;

    .line 36
    new-instance v0, Lcom/github/junrar/unpack/vm/VMCommands;

    const/16 v2, 0x28

    const/16 v3, 0x28

    move-object/from16 v65, v1

    const-string v1, "VM_MOVB"

    invoke-direct {v0, v1, v2, v3}, Lcom/github/junrar/unpack/vm/VMCommands;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/github/junrar/unpack/vm/VMCommands;->VM_MOVB:Lcom/github/junrar/unpack/vm/VMCommands;

    new-instance v1, Lcom/github/junrar/unpack/vm/VMCommands;

    const/16 v2, 0x29

    const/16 v3, 0x29

    move-object/from16 v66, v0

    const-string v0, "VM_MOVD"

    invoke-direct {v1, v0, v2, v3}, Lcom/github/junrar/unpack/vm/VMCommands;-><init>(Ljava/lang/String;II)V

    sput-object v1, Lcom/github/junrar/unpack/vm/VMCommands;->VM_MOVD:Lcom/github/junrar/unpack/vm/VMCommands;

    new-instance v0, Lcom/github/junrar/unpack/vm/VMCommands;

    const/16 v2, 0x2a

    const/16 v3, 0x2a

    move-object/from16 v67, v1

    const-string v1, "VM_CMPB"

    invoke-direct {v0, v1, v2, v3}, Lcom/github/junrar/unpack/vm/VMCommands;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/github/junrar/unpack/vm/VMCommands;->VM_CMPB:Lcom/github/junrar/unpack/vm/VMCommands;

    new-instance v1, Lcom/github/junrar/unpack/vm/VMCommands;

    const/16 v2, 0x2b

    const/16 v3, 0x2b

    move-object/from16 v68, v0

    const-string v0, "VM_CMPD"

    invoke-direct {v1, v0, v2, v3}, Lcom/github/junrar/unpack/vm/VMCommands;-><init>(Ljava/lang/String;II)V

    sput-object v1, Lcom/github/junrar/unpack/vm/VMCommands;->VM_CMPD:Lcom/github/junrar/unpack/vm/VMCommands;

    .line 38
    new-instance v0, Lcom/github/junrar/unpack/vm/VMCommands;

    const/16 v2, 0x2c

    const/16 v3, 0x2c

    move-object/from16 v69, v1

    const-string v1, "VM_ADDB"

    invoke-direct {v0, v1, v2, v3}, Lcom/github/junrar/unpack/vm/VMCommands;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/github/junrar/unpack/vm/VMCommands;->VM_ADDB:Lcom/github/junrar/unpack/vm/VMCommands;

    new-instance v1, Lcom/github/junrar/unpack/vm/VMCommands;

    const/16 v2, 0x2d

    const/16 v3, 0x2d

    move-object/from16 v70, v0

    const-string v0, "VM_ADDD"

    invoke-direct {v1, v0, v2, v3}, Lcom/github/junrar/unpack/vm/VMCommands;-><init>(Ljava/lang/String;II)V

    sput-object v1, Lcom/github/junrar/unpack/vm/VMCommands;->VM_ADDD:Lcom/github/junrar/unpack/vm/VMCommands;

    new-instance v0, Lcom/github/junrar/unpack/vm/VMCommands;

    const/16 v2, 0x2e

    const/16 v3, 0x2e

    move-object/from16 v71, v1

    const-string v1, "VM_SUBB"

    invoke-direct {v0, v1, v2, v3}, Lcom/github/junrar/unpack/vm/VMCommands;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/github/junrar/unpack/vm/VMCommands;->VM_SUBB:Lcom/github/junrar/unpack/vm/VMCommands;

    new-instance v1, Lcom/github/junrar/unpack/vm/VMCommands;

    const/16 v2, 0x2f

    const/16 v3, 0x2f

    move-object/from16 v72, v0

    const-string v0, "VM_SUBD"

    invoke-direct {v1, v0, v2, v3}, Lcom/github/junrar/unpack/vm/VMCommands;-><init>(Ljava/lang/String;II)V

    sput-object v1, Lcom/github/junrar/unpack/vm/VMCommands;->VM_SUBD:Lcom/github/junrar/unpack/vm/VMCommands;

    new-instance v0, Lcom/github/junrar/unpack/vm/VMCommands;

    const/16 v2, 0x30

    const/16 v3, 0x30

    move-object/from16 v73, v1

    const-string v1, "VM_INCB"

    invoke-direct {v0, v1, v2, v3}, Lcom/github/junrar/unpack/vm/VMCommands;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/github/junrar/unpack/vm/VMCommands;->VM_INCB:Lcom/github/junrar/unpack/vm/VMCommands;

    new-instance v1, Lcom/github/junrar/unpack/vm/VMCommands;

    const/16 v2, 0x31

    const/16 v3, 0x31

    move-object/from16 v74, v0

    const-string v0, "VM_INCD"

    invoke-direct {v1, v0, v2, v3}, Lcom/github/junrar/unpack/vm/VMCommands;-><init>(Ljava/lang/String;II)V

    sput-object v1, Lcom/github/junrar/unpack/vm/VMCommands;->VM_INCD:Lcom/github/junrar/unpack/vm/VMCommands;

    new-instance v0, Lcom/github/junrar/unpack/vm/VMCommands;

    const/16 v2, 0x32

    const/16 v3, 0x32

    move-object/from16 v75, v1

    const-string v1, "VM_DECB"

    invoke-direct {v0, v1, v2, v3}, Lcom/github/junrar/unpack/vm/VMCommands;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/github/junrar/unpack/vm/VMCommands;->VM_DECB:Lcom/github/junrar/unpack/vm/VMCommands;

    .line 39
    new-instance v1, Lcom/github/junrar/unpack/vm/VMCommands;

    const/16 v2, 0x33

    const/16 v3, 0x33

    move-object/from16 v76, v0

    const-string v0, "VM_DECD"

    invoke-direct {v1, v0, v2, v3}, Lcom/github/junrar/unpack/vm/VMCommands;-><init>(Ljava/lang/String;II)V

    sput-object v1, Lcom/github/junrar/unpack/vm/VMCommands;->VM_DECD:Lcom/github/junrar/unpack/vm/VMCommands;

    new-instance v0, Lcom/github/junrar/unpack/vm/VMCommands;

    const/16 v2, 0x34

    const/16 v3, 0x34

    move-object/from16 v77, v1

    const-string v1, "VM_NEGB"

    invoke-direct {v0, v1, v2, v3}, Lcom/github/junrar/unpack/vm/VMCommands;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/github/junrar/unpack/vm/VMCommands;->VM_NEGB:Lcom/github/junrar/unpack/vm/VMCommands;

    new-instance v1, Lcom/github/junrar/unpack/vm/VMCommands;

    const/16 v2, 0x35

    const/16 v3, 0x35

    move-object/from16 v78, v0

    const-string v0, "VM_NEGD"

    invoke-direct {v1, v0, v2, v3}, Lcom/github/junrar/unpack/vm/VMCommands;-><init>(Ljava/lang/String;II)V

    sput-object v1, Lcom/github/junrar/unpack/vm/VMCommands;->VM_NEGD:Lcom/github/junrar/unpack/vm/VMCommands;

    .line 42
    new-instance v0, Lcom/github/junrar/unpack/vm/VMCommands;

    const/16 v2, 0x36

    const/16 v3, 0x36

    move-object/from16 v79, v1

    const-string v1, "VM_STANDARD"

    invoke-direct {v0, v1, v2, v3}, Lcom/github/junrar/unpack/vm/VMCommands;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/github/junrar/unpack/vm/VMCommands;->VM_STANDARD:Lcom/github/junrar/unpack/vm/VMCommands;

    const/16 v1, 0x37

    .line 26
    new-array v1, v1, [Lcom/github/junrar/unpack/vm/VMCommands;

    aput-object v30, v1, v16

    aput-object v32, v1, v18

    aput-object v47, v1, v20

    aput-object v5, v1, v22

    aput-object v7, v1, v24

    aput-object v9, v1, v26

    aput-object v11, v1, v28

    aput-object v13, v1, v17

    aput-object v15, v1, v19

    aput-object v34, v1, v21

    aput-object v4, v1, v23

    aput-object v6, v1, v25

    aput-object v8, v1, v27

    aput-object v10, v1, v29

    aput-object v12, v1, v31

    aput-object v14, v1, v33

    aput-object v36, v1, v35

    aput-object v38, v1, v37

    aput-object v40, v1, v39

    aput-object v42, v1, v41

    aput-object v44, v1, v43

    aput-object v46, v1, v45

    const/16 v2, 0x16

    aput-object v48, v1, v2

    const/16 v2, 0x17

    aput-object v49, v1, v2

    const/16 v2, 0x18

    aput-object v50, v1, v2

    const/16 v2, 0x19

    aput-object v51, v1, v2

    const/16 v2, 0x1a

    aput-object v52, v1, v2

    const/16 v2, 0x1b

    aput-object v53, v1, v2

    const/16 v2, 0x1c

    aput-object v54, v1, v2

    const/16 v2, 0x1d

    aput-object v55, v1, v2

    const/16 v2, 0x1e

    aput-object v56, v1, v2

    const/16 v2, 0x1f

    aput-object v57, v1, v2

    const/16 v2, 0x20

    aput-object v58, v1, v2

    const/16 v2, 0x21

    aput-object v59, v1, v2

    const/16 v2, 0x22

    aput-object v60, v1, v2

    const/16 v2, 0x23

    aput-object v61, v1, v2

    const/16 v2, 0x24

    aput-object v62, v1, v2

    const/16 v2, 0x25

    aput-object v63, v1, v2

    const/16 v2, 0x26

    aput-object v64, v1, v2

    const/16 v2, 0x27

    aput-object v65, v1, v2

    const/16 v2, 0x28

    aput-object v66, v1, v2

    const/16 v2, 0x29

    aput-object v67, v1, v2

    const/16 v2, 0x2a

    aput-object v68, v1, v2

    const/16 v2, 0x2b

    aput-object v69, v1, v2

    const/16 v2, 0x2c

    aput-object v70, v1, v2

    const/16 v2, 0x2d

    aput-object v71, v1, v2

    const/16 v2, 0x2e

    aput-object v72, v1, v2

    const/16 v2, 0x2f

    aput-object v73, v1, v2

    const/16 v2, 0x30

    aput-object v74, v1, v2

    const/16 v2, 0x31

    aput-object v75, v1, v2

    const/16 v2, 0x32

    aput-object v76, v1, v2

    const/16 v2, 0x33

    aput-object v77, v1, v2

    const/16 v2, 0x34

    aput-object v78, v1, v2

    const/16 v2, 0x35

    aput-object v79, v1, v2

    const/16 v2, 0x36

    aput-object v0, v1, v2

    sput-object v1, Lcom/github/junrar/unpack/vm/VMCommands;->$VALUES:[Lcom/github/junrar/unpack/vm/VMCommands;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;II)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)V"
        }
    .end annotation

    .line 46
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 47
    iput p3, p0, Lcom/github/junrar/unpack/vm/VMCommands;->vmCommand:I

    return-void
.end method

.method public static findVMCommand(I)Lcom/github/junrar/unpack/vm/VMCommands;
    .locals 2

    .line 59
    sget-object v0, Lcom/github/junrar/unpack/vm/VMCommands;->VM_MOV:Lcom/github/junrar/unpack/vm/VMCommands;

    invoke-virtual {v0, p0}, Lcom/github/junrar/unpack/vm/VMCommands;->equals(I)Z

    move-result v1

    if-eqz v1, :cond_0

    return-object v0

    .line 62
    :cond_0
    sget-object v0, Lcom/github/junrar/unpack/vm/VMCommands;->VM_CMP:Lcom/github/junrar/unpack/vm/VMCommands;

    invoke-virtual {v0, p0}, Lcom/github/junrar/unpack/vm/VMCommands;->equals(I)Z

    move-result v1

    if-eqz v1, :cond_1

    return-object v0

    .line 65
    :cond_1
    sget-object v0, Lcom/github/junrar/unpack/vm/VMCommands;->VM_ADD:Lcom/github/junrar/unpack/vm/VMCommands;

    invoke-virtual {v0, p0}, Lcom/github/junrar/unpack/vm/VMCommands;->equals(I)Z

    move-result v1

    if-eqz v1, :cond_2

    return-object v0

    .line 68
    :cond_2
    sget-object v0, Lcom/github/junrar/unpack/vm/VMCommands;->VM_SUB:Lcom/github/junrar/unpack/vm/VMCommands;

    invoke-virtual {v0, p0}, Lcom/github/junrar/unpack/vm/VMCommands;->equals(I)Z

    move-result v1

    if-eqz v1, :cond_3

    return-object v0

    .line 71
    :cond_3
    sget-object v0, Lcom/github/junrar/unpack/vm/VMCommands;->VM_JZ:Lcom/github/junrar/unpack/vm/VMCommands;

    invoke-virtual {v0, p0}, Lcom/github/junrar/unpack/vm/VMCommands;->equals(I)Z

    move-result v1

    if-eqz v1, :cond_4

    return-object v0

    .line 74
    :cond_4
    sget-object v0, Lcom/github/junrar/unpack/vm/VMCommands;->VM_JNZ:Lcom/github/junrar/unpack/vm/VMCommands;

    invoke-virtual {v0, p0}, Lcom/github/junrar/unpack/vm/VMCommands;->equals(I)Z

    move-result v1

    if-eqz v1, :cond_5

    return-object v0

    .line 77
    :cond_5
    sget-object v0, Lcom/github/junrar/unpack/vm/VMCommands;->VM_INC:Lcom/github/junrar/unpack/vm/VMCommands;

    invoke-virtual {v0, p0}, Lcom/github/junrar/unpack/vm/VMCommands;->equals(I)Z

    move-result v1

    if-eqz v1, :cond_6

    return-object v0

    .line 80
    :cond_6
    sget-object v0, Lcom/github/junrar/unpack/vm/VMCommands;->VM_DEC:Lcom/github/junrar/unpack/vm/VMCommands;

    invoke-virtual {v0, p0}, Lcom/github/junrar/unpack/vm/VMCommands;->equals(I)Z

    move-result v1

    if-eqz v1, :cond_7

    return-object v0

    .line 83
    :cond_7
    sget-object v0, Lcom/github/junrar/unpack/vm/VMCommands;->VM_JMP:Lcom/github/junrar/unpack/vm/VMCommands;

    invoke-virtual {v0, p0}, Lcom/github/junrar/unpack/vm/VMCommands;->equals(I)Z

    move-result v1

    if-eqz v1, :cond_8

    return-object v0

    .line 86
    :cond_8
    sget-object v0, Lcom/github/junrar/unpack/vm/VMCommands;->VM_XOR:Lcom/github/junrar/unpack/vm/VMCommands;

    invoke-virtual {v0, p0}, Lcom/github/junrar/unpack/vm/VMCommands;->equals(I)Z

    move-result v1

    if-eqz v1, :cond_9

    return-object v0

    .line 89
    :cond_9
    sget-object v0, Lcom/github/junrar/unpack/vm/VMCommands;->VM_AND:Lcom/github/junrar/unpack/vm/VMCommands;

    invoke-virtual {v0, p0}, Lcom/github/junrar/unpack/vm/VMCommands;->equals(I)Z

    move-result v1

    if-eqz v1, :cond_a

    return-object v0

    .line 92
    :cond_a
    sget-object v0, Lcom/github/junrar/unpack/vm/VMCommands;->VM_OR:Lcom/github/junrar/unpack/vm/VMCommands;

    invoke-virtual {v0, p0}, Lcom/github/junrar/unpack/vm/VMCommands;->equals(I)Z

    move-result v1

    if-eqz v1, :cond_b

    return-object v0

    .line 95
    :cond_b
    sget-object v0, Lcom/github/junrar/unpack/vm/VMCommands;->VM_TEST:Lcom/github/junrar/unpack/vm/VMCommands;

    invoke-virtual {v0, p0}, Lcom/github/junrar/unpack/vm/VMCommands;->equals(I)Z

    move-result v1

    if-eqz v1, :cond_c

    return-object v0

    .line 98
    :cond_c
    sget-object v0, Lcom/github/junrar/unpack/vm/VMCommands;->VM_JS:Lcom/github/junrar/unpack/vm/VMCommands;

    invoke-virtual {v0, p0}, Lcom/github/junrar/unpack/vm/VMCommands;->equals(I)Z

    move-result v1

    if-eqz v1, :cond_d

    return-object v0

    .line 101
    :cond_d
    sget-object v0, Lcom/github/junrar/unpack/vm/VMCommands;->VM_JNS:Lcom/github/junrar/unpack/vm/VMCommands;

    invoke-virtual {v0, p0}, Lcom/github/junrar/unpack/vm/VMCommands;->equals(I)Z

    move-result v1

    if-eqz v1, :cond_e

    return-object v0

    .line 104
    :cond_e
    sget-object v0, Lcom/github/junrar/unpack/vm/VMCommands;->VM_JB:Lcom/github/junrar/unpack/vm/VMCommands;

    invoke-virtual {v0, p0}, Lcom/github/junrar/unpack/vm/VMCommands;->equals(I)Z

    move-result v1

    if-eqz v1, :cond_f

    return-object v0

    .line 107
    :cond_f
    sget-object v0, Lcom/github/junrar/unpack/vm/VMCommands;->VM_JBE:Lcom/github/junrar/unpack/vm/VMCommands;

    invoke-virtual {v0, p0}, Lcom/github/junrar/unpack/vm/VMCommands;->equals(I)Z

    move-result v1

    if-eqz v1, :cond_10

    return-object v0

    .line 110
    :cond_10
    sget-object v0, Lcom/github/junrar/unpack/vm/VMCommands;->VM_JA:Lcom/github/junrar/unpack/vm/VMCommands;

    invoke-virtual {v0, p0}, Lcom/github/junrar/unpack/vm/VMCommands;->equals(I)Z

    move-result v1

    if-eqz v1, :cond_11

    return-object v0

    .line 113
    :cond_11
    sget-object v0, Lcom/github/junrar/unpack/vm/VMCommands;->VM_JAE:Lcom/github/junrar/unpack/vm/VMCommands;

    invoke-virtual {v0, p0}, Lcom/github/junrar/unpack/vm/VMCommands;->equals(I)Z

    move-result v1

    if-eqz v1, :cond_12

    return-object v0

    .line 116
    :cond_12
    sget-object v0, Lcom/github/junrar/unpack/vm/VMCommands;->VM_PUSH:Lcom/github/junrar/unpack/vm/VMCommands;

    invoke-virtual {v0, p0}, Lcom/github/junrar/unpack/vm/VMCommands;->equals(I)Z

    move-result v1

    if-eqz v1, :cond_13

    return-object v0

    .line 119
    :cond_13
    sget-object v0, Lcom/github/junrar/unpack/vm/VMCommands;->VM_POP:Lcom/github/junrar/unpack/vm/VMCommands;

    invoke-virtual {v0, p0}, Lcom/github/junrar/unpack/vm/VMCommands;->equals(I)Z

    move-result v1

    if-eqz v1, :cond_14

    return-object v0

    .line 122
    :cond_14
    sget-object v0, Lcom/github/junrar/unpack/vm/VMCommands;->VM_CALL:Lcom/github/junrar/unpack/vm/VMCommands;

    invoke-virtual {v0, p0}, Lcom/github/junrar/unpack/vm/VMCommands;->equals(I)Z

    move-result v1

    if-eqz v1, :cond_15

    return-object v0

    .line 125
    :cond_15
    sget-object v0, Lcom/github/junrar/unpack/vm/VMCommands;->VM_RET:Lcom/github/junrar/unpack/vm/VMCommands;

    invoke-virtual {v0, p0}, Lcom/github/junrar/unpack/vm/VMCommands;->equals(I)Z

    move-result v1

    if-eqz v1, :cond_16

    return-object v0

    .line 128
    :cond_16
    sget-object v0, Lcom/github/junrar/unpack/vm/VMCommands;->VM_NOT:Lcom/github/junrar/unpack/vm/VMCommands;

    invoke-virtual {v0, p0}, Lcom/github/junrar/unpack/vm/VMCommands;->equals(I)Z

    move-result v1

    if-eqz v1, :cond_17

    return-object v0

    .line 131
    :cond_17
    sget-object v0, Lcom/github/junrar/unpack/vm/VMCommands;->VM_SHL:Lcom/github/junrar/unpack/vm/VMCommands;

    invoke-virtual {v0, p0}, Lcom/github/junrar/unpack/vm/VMCommands;->equals(I)Z

    move-result v1

    if-eqz v1, :cond_18

    return-object v0

    .line 134
    :cond_18
    sget-object v0, Lcom/github/junrar/unpack/vm/VMCommands;->VM_SHR:Lcom/github/junrar/unpack/vm/VMCommands;

    invoke-virtual {v0, p0}, Lcom/github/junrar/unpack/vm/VMCommands;->equals(I)Z

    move-result v1

    if-eqz v1, :cond_19

    return-object v0

    .line 137
    :cond_19
    sget-object v0, Lcom/github/junrar/unpack/vm/VMCommands;->VM_SAR:Lcom/github/junrar/unpack/vm/VMCommands;

    invoke-virtual {v0, p0}, Lcom/github/junrar/unpack/vm/VMCommands;->equals(I)Z

    move-result v1

    if-eqz v1, :cond_1a

    return-object v0

    .line 140
    :cond_1a
    sget-object v0, Lcom/github/junrar/unpack/vm/VMCommands;->VM_NEG:Lcom/github/junrar/unpack/vm/VMCommands;

    invoke-virtual {v0, p0}, Lcom/github/junrar/unpack/vm/VMCommands;->equals(I)Z

    move-result v1

    if-eqz v1, :cond_1b

    return-object v0

    .line 143
    :cond_1b
    sget-object v0, Lcom/github/junrar/unpack/vm/VMCommands;->VM_PUSHA:Lcom/github/junrar/unpack/vm/VMCommands;

    invoke-virtual {v0, p0}, Lcom/github/junrar/unpack/vm/VMCommands;->equals(I)Z

    move-result v1

    if-eqz v1, :cond_1c

    return-object v0

    .line 146
    :cond_1c
    sget-object v0, Lcom/github/junrar/unpack/vm/VMCommands;->VM_POPA:Lcom/github/junrar/unpack/vm/VMCommands;

    invoke-virtual {v0, p0}, Lcom/github/junrar/unpack/vm/VMCommands;->equals(I)Z

    move-result v1

    if-eqz v1, :cond_1d

    return-object v0

    .line 149
    :cond_1d
    sget-object v0, Lcom/github/junrar/unpack/vm/VMCommands;->VM_PUSHF:Lcom/github/junrar/unpack/vm/VMCommands;

    invoke-virtual {v0, p0}, Lcom/github/junrar/unpack/vm/VMCommands;->equals(I)Z

    move-result v1

    if-eqz v1, :cond_1e

    return-object v0

    .line 152
    :cond_1e
    sget-object v0, Lcom/github/junrar/unpack/vm/VMCommands;->VM_POPF:Lcom/github/junrar/unpack/vm/VMCommands;

    invoke-virtual {v0, p0}, Lcom/github/junrar/unpack/vm/VMCommands;->equals(I)Z

    move-result v1

    if-eqz v1, :cond_1f

    return-object v0

    .line 155
    :cond_1f
    sget-object v0, Lcom/github/junrar/unpack/vm/VMCommands;->VM_MOVZX:Lcom/github/junrar/unpack/vm/VMCommands;

    invoke-virtual {v0, p0}, Lcom/github/junrar/unpack/vm/VMCommands;->equals(I)Z

    move-result v1

    if-eqz v1, :cond_20

    return-object v0

    .line 158
    :cond_20
    sget-object v0, Lcom/github/junrar/unpack/vm/VMCommands;->VM_MOVSX:Lcom/github/junrar/unpack/vm/VMCommands;

    invoke-virtual {v0, p0}, Lcom/github/junrar/unpack/vm/VMCommands;->equals(I)Z

    move-result v1

    if-eqz v1, :cond_21

    return-object v0

    .line 161
    :cond_21
    sget-object v0, Lcom/github/junrar/unpack/vm/VMCommands;->VM_XCHG:Lcom/github/junrar/unpack/vm/VMCommands;

    invoke-virtual {v0, p0}, Lcom/github/junrar/unpack/vm/VMCommands;->equals(I)Z

    move-result v1

    if-eqz v1, :cond_22

    return-object v0

    .line 164
    :cond_22
    sget-object v0, Lcom/github/junrar/unpack/vm/VMCommands;->VM_MUL:Lcom/github/junrar/unpack/vm/VMCommands;

    invoke-virtual {v0, p0}, Lcom/github/junrar/unpack/vm/VMCommands;->equals(I)Z

    move-result v1

    if-eqz v1, :cond_23

    return-object v0

    .line 167
    :cond_23
    sget-object v0, Lcom/github/junrar/unpack/vm/VMCommands;->VM_DIV:Lcom/github/junrar/unpack/vm/VMCommands;

    invoke-virtual {v0, p0}, Lcom/github/junrar/unpack/vm/VMCommands;->equals(I)Z

    move-result v1

    if-eqz v1, :cond_24

    return-object v0

    .line 170
    :cond_24
    sget-object v0, Lcom/github/junrar/unpack/vm/VMCommands;->VM_ADC:Lcom/github/junrar/unpack/vm/VMCommands;

    invoke-virtual {v0, p0}, Lcom/github/junrar/unpack/vm/VMCommands;->equals(I)Z

    move-result v1

    if-eqz v1, :cond_25

    return-object v0

    .line 173
    :cond_25
    sget-object v0, Lcom/github/junrar/unpack/vm/VMCommands;->VM_SBB:Lcom/github/junrar/unpack/vm/VMCommands;

    invoke-virtual {v0, p0}, Lcom/github/junrar/unpack/vm/VMCommands;->equals(I)Z

    move-result v1

    if-eqz v1, :cond_26

    return-object v0

    .line 176
    :cond_26
    sget-object v0, Lcom/github/junrar/unpack/vm/VMCommands;->VM_PRINT:Lcom/github/junrar/unpack/vm/VMCommands;

    invoke-virtual {v0, p0}, Lcom/github/junrar/unpack/vm/VMCommands;->equals(I)Z

    move-result v1

    if-eqz v1, :cond_27

    return-object v0

    .line 179
    :cond_27
    sget-object v0, Lcom/github/junrar/unpack/vm/VMCommands;->VM_MOVB:Lcom/github/junrar/unpack/vm/VMCommands;

    invoke-virtual {v0, p0}, Lcom/github/junrar/unpack/vm/VMCommands;->equals(I)Z

    move-result v1

    if-eqz v1, :cond_28

    return-object v0

    .line 182
    :cond_28
    sget-object v0, Lcom/github/junrar/unpack/vm/VMCommands;->VM_MOVD:Lcom/github/junrar/unpack/vm/VMCommands;

    invoke-virtual {v0, p0}, Lcom/github/junrar/unpack/vm/VMCommands;->equals(I)Z

    move-result v1

    if-eqz v1, :cond_29

    return-object v0

    .line 185
    :cond_29
    sget-object v0, Lcom/github/junrar/unpack/vm/VMCommands;->VM_CMPB:Lcom/github/junrar/unpack/vm/VMCommands;

    invoke-virtual {v0, p0}, Lcom/github/junrar/unpack/vm/VMCommands;->equals(I)Z

    move-result v1

    if-eqz v1, :cond_2a

    return-object v0

    .line 188
    :cond_2a
    sget-object v0, Lcom/github/junrar/unpack/vm/VMCommands;->VM_CMPD:Lcom/github/junrar/unpack/vm/VMCommands;

    invoke-virtual {v0, p0}, Lcom/github/junrar/unpack/vm/VMCommands;->equals(I)Z

    move-result v1

    if-eqz v1, :cond_2b

    return-object v0

    .line 191
    :cond_2b
    sget-object v0, Lcom/github/junrar/unpack/vm/VMCommands;->VM_ADDB:Lcom/github/junrar/unpack/vm/VMCommands;

    invoke-virtual {v0, p0}, Lcom/github/junrar/unpack/vm/VMCommands;->equals(I)Z

    move-result v1

    if-eqz v1, :cond_2c

    return-object v0

    .line 194
    :cond_2c
    sget-object v0, Lcom/github/junrar/unpack/vm/VMCommands;->VM_ADDD:Lcom/github/junrar/unpack/vm/VMCommands;

    invoke-virtual {v0, p0}, Lcom/github/junrar/unpack/vm/VMCommands;->equals(I)Z

    move-result v1

    if-eqz v1, :cond_2d

    return-object v0

    .line 197
    :cond_2d
    sget-object v0, Lcom/github/junrar/unpack/vm/VMCommands;->VM_SUBB:Lcom/github/junrar/unpack/vm/VMCommands;

    invoke-virtual {v0, p0}, Lcom/github/junrar/unpack/vm/VMCommands;->equals(I)Z

    move-result v1

    if-eqz v1, :cond_2e

    return-object v0

    .line 200
    :cond_2e
    sget-object v0, Lcom/github/junrar/unpack/vm/VMCommands;->VM_SUBD:Lcom/github/junrar/unpack/vm/VMCommands;

    invoke-virtual {v0, p0}, Lcom/github/junrar/unpack/vm/VMCommands;->equals(I)Z

    move-result v1

    if-eqz v1, :cond_2f

    return-object v0

    .line 203
    :cond_2f
    sget-object v0, Lcom/github/junrar/unpack/vm/VMCommands;->VM_INCB:Lcom/github/junrar/unpack/vm/VMCommands;

    invoke-virtual {v0, p0}, Lcom/github/junrar/unpack/vm/VMCommands;->equals(I)Z

    move-result v1

    if-eqz v1, :cond_30

    return-object v0

    .line 206
    :cond_30
    sget-object v0, Lcom/github/junrar/unpack/vm/VMCommands;->VM_INCD:Lcom/github/junrar/unpack/vm/VMCommands;

    invoke-virtual {v0, p0}, Lcom/github/junrar/unpack/vm/VMCommands;->equals(I)Z

    move-result v1

    if-eqz v1, :cond_31

    return-object v0

    .line 209
    :cond_31
    sget-object v0, Lcom/github/junrar/unpack/vm/VMCommands;->VM_DECB:Lcom/github/junrar/unpack/vm/VMCommands;

    invoke-virtual {v0, p0}, Lcom/github/junrar/unpack/vm/VMCommands;->equals(I)Z

    move-result v1

    if-eqz v1, :cond_32

    return-object v0

    .line 212
    :cond_32
    sget-object v0, Lcom/github/junrar/unpack/vm/VMCommands;->VM_DECD:Lcom/github/junrar/unpack/vm/VMCommands;

    invoke-virtual {v0, p0}, Lcom/github/junrar/unpack/vm/VMCommands;->equals(I)Z

    move-result v1

    if-eqz v1, :cond_33

    return-object v0

    .line 215
    :cond_33
    sget-object v0, Lcom/github/junrar/unpack/vm/VMCommands;->VM_NEGB:Lcom/github/junrar/unpack/vm/VMCommands;

    invoke-virtual {v0, p0}, Lcom/github/junrar/unpack/vm/VMCommands;->equals(I)Z

    move-result v1

    if-eqz v1, :cond_34

    return-object v0

    .line 218
    :cond_34
    sget-object v0, Lcom/github/junrar/unpack/vm/VMCommands;->VM_NEGD:Lcom/github/junrar/unpack/vm/VMCommands;

    invoke-virtual {v0, p0}, Lcom/github/junrar/unpack/vm/VMCommands;->equals(I)Z

    move-result v1

    if-eqz v1, :cond_35

    return-object v0

    .line 221
    :cond_35
    sget-object v0, Lcom/github/junrar/unpack/vm/VMCommands;->VM_STANDARD:Lcom/github/junrar/unpack/vm/VMCommands;

    invoke-virtual {v0, p0}, Lcom/github/junrar/unpack/vm/VMCommands;->equals(I)Z

    move-result p0

    if-eqz p0, :cond_36

    return-object v0

    :cond_36
    const/4 p0, 0x0

    return-object p0
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/github/junrar/unpack/vm/VMCommands;
    .locals 1

    .line 26
    const-class v0, Lcom/github/junrar/unpack/vm/VMCommands;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/github/junrar/unpack/vm/VMCommands;

    return-object p0
.end method

.method public static values()[Lcom/github/junrar/unpack/vm/VMCommands;
    .locals 1

    .line 26
    sget-object v0, Lcom/github/junrar/unpack/vm/VMCommands;->$VALUES:[Lcom/github/junrar/unpack/vm/VMCommands;

    invoke-virtual {v0}, [Lcom/github/junrar/unpack/vm/VMCommands;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/github/junrar/unpack/vm/VMCommands;

    return-object v0
.end method


# virtual methods
.method public equals(I)Z
    .locals 1

    .line 55
    iget v0, p0, Lcom/github/junrar/unpack/vm/VMCommands;->vmCommand:I

    if-ne v0, p1, :cond_0

    const/4 p1, 0x1

    return p1

    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public getVMCommand()I
    .locals 1

    .line 51
    iget v0, p0, Lcom/github/junrar/unpack/vm/VMCommands;->vmCommand:I

    return v0
.end method
